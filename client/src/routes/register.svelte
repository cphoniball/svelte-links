<script>
  const initialUser = {
    username: "",
    email: "",
    password: "",
    password_confirmation: ""
  };

  let user = { ...initialUser };

  const createUser = async () => {
    const response = await fetch("http://localhost:4000/users", {
      method: "post",
      body: JSON.stringify(user),
      headers: { "Content-Type": "application/json" }
    });

    user = { ...initialUser };

    return response.json();
  };

  const submitCreateUser = async () => {
    const user = await createUser();
    console.log(user);
  };
</script>

<style>

</style>

<form on:submit|preventDefault={submitCreateUser}>
  <div class="form-group">
    <label for="username">Username</label>
    <input
      class="form-control"
      type="text"
      name="username"
      bind:value={user.username} />
  </div>

  <div class="form-group">
    <label for="email">Email Address</label>
    <input
      class="form-control"
      type="email"
      name="email"
      bind:value={user.email} />
  </div>

  <div class="form-group">
    <label for="password">Password</label>
    <input
      class="form-control"
      type="password"
      name="password"
      bind:value={user.password} />
  </div>

  <div class="form-group">
    <label for="password_confirmation">Confirm Password</label>
    <input
      class="form-control"
      type="password"
      name="password_confirmation"
      bind:value={user.password_confirmation} />
  </div>

  <button type="submit" class="btn btn-primary">Create Account</button>
</form>
