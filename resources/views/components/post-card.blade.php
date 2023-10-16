@props(['post'])

<x-card>
  <div class="flex">
      @csrf
    <img class="hidden w-48 mr-6 md:block"
      src="{{$post->logo ? asset('storage/' . $post->logo) : asset('/images/no-image.png')}}" alt="" />
    <div>
      <h3 class="text-2xl">
        <a href="/posts/{{$post->id}}">{{$post->title}}</a>
      </h3>
      <!-- <div class="text-xl font-bold mb-4">{{$listing->company}}</div> -->
      <!-- <x-listing-tags :tagsCsv="$listing->tags" /> -->
      <div class="text-lg mt-4">
        <!-- <i class="fa-solid fa-location-dot"></i> {{$listing->location}} -->
      </div>
        <p class="fa-solid">{{$post->description}}</p> 
      <!-- <div class="text-xl font-bold mb-4">{{$listing->price}}</div> -->
      <!-- <button class="h-10 w-20 text-white rounded-lg bg-laravel hover:bg-indigo-700">${{$listing->price}}</button> -->
      <div >

            
            
        
      </div>
    </div>
  </div>
</x-card>