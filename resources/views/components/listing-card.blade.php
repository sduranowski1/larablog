@props(['listing'])

<x-card>
  <div class="flex">
      @csrf
    <img class="hidden w-48 mr-6 md:block"
      src="{{$listing->logo ? asset('storage/' . $listing->logo) : asset('/images/no-image.png')}}" alt="" />
    <div>
      <h3 class="text-2xl">
        <a href="/listings/{{$listing->id}}">{{$listing->title}}</a>
      </h3>
      <div class="text-xl font-bold mb-4">{{$listing->category->name}}</div>
      <!-- <x-listing-tags :tagsCsv="$listing->tags" /> -->
      <div class="text-lg mt-4">
        <i class="fa-solid fa-location-dot"></i> {{$listing->user->name}}
      </div>
      <div class="text-lg mt-4">
        <i >{{$listing->created_at}}</i> 
      </div>
        <p class="fa-solid">{{$listing->description}}</p> 
      <!-- <div class="text-xl font-bold mb-4">{{$listing->price}}</div> -->
      <!-- <button class="h-10 w-20 text-white rounded-lg bg-laravel hover:bg-indigo-700">${{$listing->price}}</button> -->
      <div >

            
            
        
      </div>
    </div>
  </div>
</x-card>