<footer class="bg-body-tertiary">
        <div class="container-fluid">
            <div class="container pt-3">
                <div class="row  d-flex justify-content-between">
                    <div class="col-lg-4 ">
                        <a href="homepage"> <img src="../img/ABCLogo2.png" alt="ABCLogo" class="img-fluid">
                        </a>
                        <h5 class="mb-3">About Us</h5>
                        <p>ABC Job Jobs Pte Ltd is a company engaged in technology and
                            information. We provide the Community Portal solutions for your
                            various job and business needs.</p>
                    </div>
                    <div class="col-md-3 pt-5">
                        <h5 class="mb-3">Contact Us</h5>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-decoration-none">Jl. Jend.
                                    Sudirman No. 123, Jakarta</a></li>
                            <li><a href="#" class="text-decoration-none">0800-123-4567</a></li>
                            <li><a href="#" class="text-decoration-none">info@abcjob.com</a></li>
                        </ul>
                    </div>
                    <hr>
                </div>
            </div>
            <div class="row pb-1">
                <div class="col-md-12">
                    <p class="text-center  text-muted">&copy; 2023 ABC Jobs Pte Ltd
                        | All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </footer>
    <script>
		const followBtn = document.querySelector(".follow");
		followBtn.addEventListener("click", () => {
			if(followBtn.innerHTML == "Follow") {
				followBtn.classList.remove("btn-outline-primary");
				followBtn.classList.add("btn-primary");
				followBtn.innerHTML = "Followed";
			} else {
				followBtn.classList.add("btn-outline-primary");
				followBtn.classList.remove("btn-primary");
				followBtn.innerHTML = "Follow";
			}
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
  $(document).ready(function() {
	// Mengubah warna tombol comment menjadi abu saat diklik
	    $(".btn-comment").click(function(event) {
	      event.preventDefault();
	      $(this).toggleClass("btn-outline-secondary btn-outline-secondary");
	    });
    // Mengubah warna tombol Like menjadi merah saat diklik
    $(".btn-like").click(function(event) {
      event.preventDefault();
      $(this).toggleClass("btn-outline-secondary btn-outline-primary");
    });

    // Mengubah warna tombol Save menjadi hijau saat diklik
    $(".btn-save").click(function(event) {
      event.preventDefault();
      $(this).toggleClass("btn-outline-secondary btn-outline-success");
    });
  });
</script>
	<script>
  // mencari semua tombol follow di halaman
  const followButtons = document.querySelectorAll('.follow-btn');

  // mengubah tombol follow menjadi followed ketika di klik
  function toggleFollow() {
    if (this.innerHTML === 'Follow') {
      this.classList.remove('btn-outline-primary');
      this.classList.add('btn-primary');
      this.innerHTML = 'Followed';
    } else {
      this.classList.remove('btn-primary');
      this.classList.add('btn-outline-primary');
      this.innerHTML = 'Follow';
    }
  }

  // menambahkan event listener ke setiap tombol follow
  followButtons.forEach(button => {
    button.addEventListener('click', toggleFollow);
  });
</script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>