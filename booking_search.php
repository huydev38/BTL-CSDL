<?php 
include 'admin/db_connect.php'; 
if($_SERVER['REQUEST_METHOD'] == "POST"){
	foreach($_POST as $k => $v){
		$$k = $v;
	}
}

?>
        <header class="masthead">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-center text-center">
                    <div class="col-lg-10 align-self-end mb-4 page-title">
                    	<h3 class="text-white">Flights</h3>
                        <hr class="divider my-2" />
                        <div class="col-md-12 mb-2 text-center">
                        <div class="card">
                            <div class="card-body">
                                <form id="manage-filter"  action="index.php?page=booking_search" method="POST">
                                    
                                <div class="row-form-group">
                                <div class="row-sm-4">
                                <input type="text" name="buyerTele" required placeholder="Buyer Telephone">

                                        </div>
                                            
                                    
                                        <div class="col-sm-4 offset-sm-4">
                                            <button class="btn btn-block btn-sm btn-primary"> Find Flights</button>
                                        </div>
                                </div>
                                
                                </form>
                            </div>
                        </div>
                    </div>                        
                    </div>
                    </div>
                    
                </div>
            </div>
        </header>
	<section class="page-section" id="flight" >
        <div class="container">
        	<div class="card">
        		<div class="card-body">
        			<div class="col-lg-12">
						
						<hr class="divider">
				<?php 
                				
                if($_SERVER['REQUEST_METHOD'] == "POST" ):

				$airport = $conn->query("SELECT * FROM airport_list ");
				while($row = $airport->fetch_assoc()){
					$aname[$row['id']] = ucwords($row['airport'].', '.$row['location']);
				}
				$where = "where buyerTele = ".$buyerTele;
				
                $flight = $conn->query("SELECT f.*,a.airlines,a.logo_path,b.* FROM flight_list f inner join booked_flight b on b.flight_id = f.id inner join airlines_list a  on f.airline_id = a.id $where order by f.id");
				if($flight->num_rows > 0):
				while($row=$flight->fetch_assoc()):
					$booked = $conn->query("SELECT * FROM booked_flight where flight_id = ".$row['id'])->num_rows;
				?>
				<div class="row align-items-center">
					<div class="col-md-3">
						<img src="assets/img/<?php echo $row['logo_path'] ?>" alt="">
					</div>
					<div class="col-md-6">
						 <p><b><?php echo $aname[$row['departure_airport_id']].' - '.$aname[$row['arrival_airport_id']] ?></b></p>
                         <p><small>Passenger name: <b><?php echo $row['name'] ?></b></small></p>
                         <p><small>Passenger contact: <b><?php echo $row['contact'] ?></b></small></p>
						 <p><small>Airline: <b><?php echo $row['airlines'] ?></b></small></p>
                         <p><small>Flight ID: <b><?php echo $row['flight_id'] ?></b></small></p>
						 <p><small>Departure: <b><?php echo date('M d,Y h:i A',strtotime($row['departure_datetime'])) ?></small></b></p>
						 <p><small>Arrival: <b><?php echo date('M d,Y h:i A',strtotime($row['arrival_datetime'])) ?></small></b></p>
                         <p><small>Status: <b><?php echo($row['arrival_datetime']>date("Y-m-d"))?"Incoming":"Arrived"?></small></b></p>
                         <p><small>Price: <b><?php echo $row['price'] ?></b></small></p>
                         <!-- them tong tien + thong tin hanh khach -->

					</div>
					
				</div>

				<hr class="divider" style="max-width: 60vw">
				<?php endwhile; ?>
				<?php else: ?>
					<div class="row align-items-center">
						<h5 class="text-center"><b>No result.</b></h5>
					</div>
				<?php endif; ?>
				<?php endif; ?>
				
				</div>
				</div>
        	</div>
        </div>
    </section>
    <style>
    	#flight img{
    		max-height: 300px;
    		max-width: 200px; 
    	}
    	#flight p{
    		margin: unset
      	}
    </style>
    <script>
        
       $('.view_schedule').click(function(){
			uni_modal($(this).attr('data-name')+" - Schedule","view_doctor_schedule.php?id="+$(this).attr('data-id'))
		})
       $('.book_flight').click(function(){
       	if($(this).attr('data-max') <= 0){
       		alert("There is no Available Seats for the selected flight");
       		return false;
       	}
			uni_modal($(this).attr('data-name'),"book_flight.php?id="+$(this).attr('data-id')+"&max="+$(this).attr('data-max'),'mid-large')
		})
        
    </script>
	
