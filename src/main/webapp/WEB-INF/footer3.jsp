    <footer class="bg-light text-center mt-5 pt-3" id="footah">
        <div class="container">
            <p>© 2023 ABC Jobs Pte Lte | All rights reserved.</p>
        </div>
    </footer>

<script>
  function validateForm() {
    const password = document.getElementById('password').value;
    const confpass = document.getElementById('confpass').value;
    if (password !== confpass) {
      alert('Password Does Not Match!');
      return false; // Mencegah form untuk melakukan submit
    } else {
      return true; // Form akan melakukan submit jika password dan confpass sama
    }
  }
</script>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>