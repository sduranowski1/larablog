<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;


class PostContoller extends Controller
{
    //
    public function index() {
        return view('posts.index',  [
        'posts' => Post::latest()->filter(request(['search']))->paginate(2)
        ]);
    }

    //Show single listing
    /**
     * Summary of show
     * @param \App\Models\Post $post
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function show(Post $post) {
        return view('posts.show', [
            'post' => $post
        ]);
    }

    // Show Create Form
    /**
     * Summary of create
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function create() {
        return view('posts.create');
    }

    // Store post data
    /**
     * Summary of store
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\RedirectResponse|mixed
     */
    public function store(Request $request) {
        $formFields = $request->validate([
            'title' => 'required',
            // 'company' => ['required', Rule::unique('listings', 'company')],
            // 'location' => 'required',
            // 'website' => 'required',
            // 'email' => ['required', 'email'],
            // 'tags' => 'required',
            'description' => 'required',
            ''
        ]);

        if($request->hasFile('logo')) {
            $formFields['logo'] = $request->file('logo')->store('logos', 'public');
        }

        $formFields['user_id'] = auth()->id();

        Post::create($formFields);

        return redirect('/')->with('message', 'Post created successfully!');
    }

    /**
     * Summary of edit
     * @param \App\Models\Post $post
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function edit(Post $post) {
        return view('posts.edit', ['post' => $post]);
    }

    /**
     * Summary of update
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Post $post
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, Post $post) {

        //Make sure logged in user is ownert
        if($post->user_id != auth()->id()) {
            abort(403, 'Unauthorized Action');
        }

        $formFields = $request->validate([
            'title' => 'required',
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

        $post->update($formFields);

        return back()->with('message', 'Post updated successfully!');
    }

    //Delete Gig
    /**
     * Summary of destroy
     * @param \App\Models\Post $post
     * @return \Illuminate\Http\RedirectResponse|mixed
     */
    public function destroy(Post $post) {
        //Make sure logged in user is ownert
        if($post->user_id != auth()->id()) {
            abort(403, 'Unauthorized Action');
        }

        // if($listing->logo && Storage::disk('public')->exists($listing->logo)) {
        //     Storage::disk('public')->delete($listing->logo);
        // }

        $post->delete();
        return redirect('/')->with('message', 'Post deleted successfully!');
    }
}
