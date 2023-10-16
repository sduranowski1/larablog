<x-layout>

    @section('content')
    @include('partials._hero')
    @include('partials._search')
    
    <div class="lg:grid lg:grid-cols-2 gap-4 space-y-4 md:space-y-0 mx-4">
        
        <x-card class="p-10 max-w-lg mx-auto mt-24"
        >
            <h1>The payment has been made successfully</h1>
            <p>{{$customer->name}}</p>
        </x-card>
    
    {{-- <div class="mt-6 p-4">
        {{$products->links()}}
    </div> --}}
    </x-layout>