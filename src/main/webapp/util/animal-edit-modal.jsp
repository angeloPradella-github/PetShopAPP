<div class="modal fade" id="editAnimalModal" tabindex="-1" role="dialog" aria-labelledby="editAnimalModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editAnimalModalLabel">Edit Animal</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="editAnimalForm" action="../services/update-animal-service.jsp" method="post">
          <!--ID NASCOSTO-->
          <input type="hidden" id="editAnimalRegistrationNumber" name="registrationNumber">
          <div class="mb-3">
            <label for="editName" class="form-label">Name</label>
            <input type="text" class="form-control" id="editName" name="animalName">
          </div>
          <div class="mb-3">
            <label for="editPurchaseDate" class="form-label">Purchase Date</label>
            <input type="date" class="form-control" id="editPurchaseDate" name="purchaseDate">
          </div>
          <div class="mb-3">
            <label for="editPrice" class="form-label">Price</label>
            <input type="number" step="0.01" class="form-control" id="editPrice" name="price">
          </div>
          <div class="mb-3">
            <label for="editType" class="form-label">Type</label>
            <input type="text" class="form-control" id="editType" name="animalType">
          </div>
          <div class="mb-3">
            <label for="editCustomerId" class="form-label">Customer ID</label>
            <input type="number" class="form-control" id="editCustomerId" name="customerId">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
