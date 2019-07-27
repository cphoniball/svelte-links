<script>
  export let value = "";
  export let label = "";
  export let name = "";
  export let id = null;
</script>

<div class="form-group" >
  <label for="username">{label}</label>
  <input class="form-control" type="text" {name} {id} bind:value />
</div>
