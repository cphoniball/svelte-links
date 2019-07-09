<script>
  export let value = "";
  export let label = "";
  export let name = "";
</script>

<div class="form-group">
  <label for="username">{label}</label>
  <input class="form-control" type="email" {name} bind:value />
</div>
