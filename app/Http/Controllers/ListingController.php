<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Listing;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ListingController extends Controller
{
    //Show all listings
    public function index() {

        return view('listings.index',  [
            'listings' => Listing::latest()->filter(request(['tag', 'search']))->paginate(4)
        ]);
    }

    //Show single listing
    public function show(Listing $listing) {
        return view('listings.show', [
            'listing' => $listing
        ]);
    }

    // Show Create Form
    public function create(Listing $listing) {
        return view('listings.create');
    }

    // Store listing data
    public function store(Request $request) {
        $formFields = $request->validate([
            'title' => 'required',
            'category_id' => 'required',
            // 'company' => ['required', Rule::unique('listings', 'company')],
            // 'location' => 'required',
            // 'website' => 'required',
            // 'email' => ['required', 'email'],
            // 'tags' => 'required',
            'description' => 'required',
        ]);

        if($request->hasFile('logo')) {
            $formFields['logo'] = $request->file('logo')->store('logos', 'public');
        }

        $formFields['user_id'] = auth()->id();

        Listing::create($formFields);

        return redirect('/')->with('message', 'Listing created successfully!');
    }

    public function edit(Listing $listing) {
        return view('listings.edit', ['listing' => $listing]);
    }

    public function update(Request $request, Listing $listing) {

        //Make sure logged in user is ownert
        if($listing->user_id != auth()->id()) {
            abort(403, 'Unauthorized Action');
        }

        $formFields = $request->validate([
            'title' => 'required',
            'category_id' => 'required',
            // 'company' => ['required'],
            // 'location' => 'required',
            // 'website' => 'required',
            // 'email' => ['required', 'email'],
            // 'tags' => 'required',
            'description' => 'required',
        ]);

        if($request->hasFile('logo')) {
            $formFields['logo'] = $request->file('logo')->store('logos', 'public');
        }

        $listing->update($formFields);

        return back()->with('message', 'Listing updated successfully!');
    }

    //Delete Gig
    public function destroy(Listing $listing) {
        //Make sure logged in user is ownert
        if($listing->user_id != auth()->id()) {
            abort(403, 'Unauthorized Action');
        }

        // if($listing->logo && Storage::disk('public')->exists($listing->logo)) {
        //     Storage::disk('public')->delete($listing->logo);
        // }

        $listing->delete();
        return redirect('/')->with('message', 'Listing deleted successfully!');
    }

    // Manage Listings
    public function manage() {
        return view('listings.manage', ['listings' => auth()->user()->listings()->get()]);
    }

    // // Manage Listings
    // public function checkout() {

    //     $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET_KEY'));

    //     $listings = Listing::all();
    //     $lineItems = [];
    //     $totalPrice = 0;
    //     foreach ($listings as $listing){
    //         $totalPrice += $listing->price;
    //         $lineItems[] = [[
    //               'price_data' => [
    //                 'currency' => 'usd',
    //                 'product_data' => [
    //                   'name' => $listing->title,
    //                 //   'images' => [$listing->logo]
    //                 ],
    //                 'unit_amount' => $listing->price * 100,
    //               ],
    //               'quantity' => 1,
    //             ]

    //         ];
    //     }
    //     $checkout_session = $stripe->checkout->sessions->create([
    //         'line_items' => $lineItems,
    //         'mode' => 'payment',
    //         'success_url' => route('checkout.success', [], true)."?session_id={CHECKOUT_SESSION_ID}",
    //         'cancel_url' => route('checkout.cancel', [], true),
    //         'customer_creation' => "always"
    //     ]);

    //     $order = new Order();
    //     $order->status = 'unpaid';
    //     $order->total_price = $totalPrice;
    //     $order->session_id = $checkout_session->id;
    //     $order->save();

    //     return redirect($checkout_session->url);

    //     // header("HTTP/1.1 303 See Other");
    //     // header("Location: " . $checkout_session->url);

    // }

    // public function success(Request $request) {

    //     $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET_KEY'));
    //     $sessionId = $request->get('session_id');
    //     try{
    //         $session = $stripe->checkout->sessions->retrieve($sessionId);
    //         if (!$session) {
    //             throw new NotFoundHttpException;
    //         }
    //         $customer = $stripe->customers->retrieve($session->customer);

    //         $order = Order::where('session_id', $session->id)->where('status', 'unpaid')->first();
    //         if (!$order) {
    //             throw new NotFoundHttpException();
    //         }
    //         $order->status = 'paid';
    //         $order->save();

    //         return view('listings.checkout-success', compact('customer'));

    //     }catch(\Exception $e) {
    //         throw new NotFoundHttpException();
    //     }

        
    // }

    // public function cancel() {
    //     $order = Order::where('session_id', 'cs_test_a1PIgpxtJXocX5TZPYLWNym854mxUTc25S9pWelJOJk7PymLRM4E0hUifX')->first();
    // }

    // public function webhook() {
    //     // The library needs to be configured with your account's secret key.
    //     // Ensure the key is kept out of any version control system you might be using.
    //     $stripe = new \Stripe\StripeClient('sk_test_...');

    //     // This is your Stripe CLI webhook secret for testing your endpoint locally.
    //     $endpoint_secret = env('STRIPE_WEBHOOK_SECRET');

    //     $payload = @file_get_contents('php://input');
    //     $sig_header = $_SERVER['HTTP_STRIPE_SIGNATURE'];
    //     $event = null;

    //     try {
    //     $event = \Stripe\Webhook::constructEvent(
    //         $payload, $sig_header, $endpoint_secret
    //     );
    //     } catch(\UnexpectedValueException $e) {
    //     // Invalid payload
    //     return response('', 400);
    //     } catch(\Stripe\Exception\SignatureVerificationException $e) {
    //     // Invalid signature
    //     return response('', 400);
    //     }

    //     // Handle the event
    //     switch ($event->type) {
    //     case 'payment_intent.succeeded':
    //         $paymentIntent = $event->data->object;
    //     // ... handle other event types
    //     default:
    //         echo 'Received unknown event type ' . $event->type;
    //     }

    //     return response('', 200);
    // }

    
}