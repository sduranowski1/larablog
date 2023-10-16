<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ProductController extends Controller
{
    public function index(Request $request) {

        $products = Product::all();
        return view('products.index', compact('products'), ['products' => Product::latest()->paginate(4)]);
    }

    // public function checkout() {

    //     $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET_KEY'));

    //     $products = Product::all();
    //     $lineItems = [];
    //     $totalPrice = 0;
    //     foreach ($products as $product){
    //         $totalPrice += $product->price;
    //         $lineItems[] = [[
    //               'price_data' => [
    //                 'currency' => 'usd',
    //                 'product_data' => [
    //                   'name' => $product->name,
    //                   'images' => [$product->image]
    //                 ],
    //                 'unit_amount' => $product->price * 100,
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

    //         return view('products.checkout-success', compact('customer'));

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
