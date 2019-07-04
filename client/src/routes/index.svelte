<script>
  let count = 1;

  const handleClick = () => (count = count + 1);
</script>

<style>
  h1,
  figure,
  p {
    text-align: center;
    margin: 0 auto;
  }

  h1 {
    font-size: 2.8em;
    text-transform: uppercase;
    font-weight: 700;
    margin: 0 0 0.5em 0;
  }

  p {
    margin: 1em auto;
  }

  @media (min-width: 480px) {
    h1 {
      font-size: 4em;
    }
  }
</style>

<svelte:head>
  <title>Sapper project template</title>
</svelte:head>

<h1>Great success! It's working!</h1>

<p>
  <strong>
    Try editing this file (src/routes/index.svelte) to test live reloading. Is
    it working now?
  </strong>
</p>
