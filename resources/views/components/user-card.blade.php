@props(['user'])

<x-card>
  <div class="flex">

      @csrf

    <div>
      <h3 class="text-2xl">
        <a href="/users/{{$user->id}}">{{$user->name}}</a>
      </h3>

      <div class="text-lg mt-4">

      </div>
      <p class="fa-solid">{{$user->bio}}</p> 
      <div >

            
            
        
      </div>
    </div>

  </div>
</x-card>