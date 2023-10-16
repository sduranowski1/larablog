@props(['product'])

<x-card>
  <div class="flex">
    <form action="{{route('checkout')}}" method="POST">
        @csrf
    <img class="hidden w-48 mr-6 md:block" src="{{$product->image}}" alt="" />
    <div>
      <h3 class="text-2xl">
        <a href="/products/{{$product->id}}">{{$product->name}}</a>
      </h3>
      <div class="text-xl font-bold mb-4">{{$product->price}}</div>
      {{-- <x-listing-tags :tagsCsv="$listing->tags" />
      <div class="text-lg mt-4">
        <i class="fa-solid fa-location-dot"></i> {{$listing->location}} --}}
      </div>


        <button class="h-10 w-20 text-white rounded-lg bg-laravel hover:bg-indigo-700">Checkout</button>

    </div>
    </form>
  </div>
</x-card>