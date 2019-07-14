<script>
  import { goto } from "@sapper/app";

  import Input from "../components/form/Input.svelte";
  import Password from "../components/form/Password.svelte";

  const credentials = {
    username: "",
    password: ""
  };

  let errorMessage = null;

  const login = async () => {
    const response = await fetch("http://localhost:4000/tokens", {
      method: "post",
      body: JSON.stringify(credentials),
      headers: { "Content-Type": "application/json" }
    });

    if (response.status !== 201) {
      errorMessage = "Invalid credentials.";
    } else {
      const body = await response.json();
      localStorage.setItem("token", body.data);
      goto("/link_pages");
    }
  };
</script>

<form on:submit|preventDefault={login}>
  {#if errorMessage}
    <div class="alert alert-danger">{errorMessage}</div>
  {/if}

  <Input
    bind:value={credentials.username}
    value={credentials.username}
    label="Username"
    name="username" />
  <Password
    bind:value={credentials.password}
    value={credentials.password}
    label="Password"
    name="password" />

  <button type="submit" class="btn btn-primary">Create Account</button>
</form>
