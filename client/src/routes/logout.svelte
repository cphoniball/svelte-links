<script>
  import { goto } from "@sapper/app";
  import { onMount } from "svelte";

  const logout = () => {
    localStorage.removeItem("token");
    // TODO: Set some state so we can show a notification message that the user is logged out
    goto("/");
  };

  onMount(logout);
</script>

<h2>Logging you out...</h2>
