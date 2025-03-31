#!/usr/bin/awk

{
# if condition to extract the column details based on its title
if( $1 ~ /^#C/ ) {
	for ( i=1; i <= NF; i++ ) {
		# Subtracting the field number by one to remove the extra column in header section
		if ( $i == "type" ) { Type_col=i-1 }
		if ( $i == "mass" ) { Mass_col=i-1 }
		if ( $i == "eam_rho" ) { Eam_rho_col=i-1 }
		if ( $i == "x" ) { X_col=i-1 }
		if ( $i == "y" ) { Y_col=i-1 }
		if ( $i == "z" ) { Z_col=i-1 }
		if ( $i == "Epot" ) { Epot_col=i-1 }
		}
	}

# if condition to filter the non header portion
if( $1 !~ /^#/ ) {
	# Scaling the potential energy and adjusting position vector's unit to Angstrom
	$X_col = $X_col * 0.1
	$Y_col = $Y_col * 0.1
	$Z_col = $Z_col * 0.1
	$Epot_col = $Epot_col * 1.6

	# x stores the original no of fields before removing any fields
	x = NF
	# (x-NF) is to account for the change in number of fields after the previous field removal
	rmcol1 = Type_col - (x-NF)
	sub($rmcol1 FS, "")

	# (x-NF) is to account for the change in number of fields after the previous field removal
	rmcol2 = Mass_col - (x-NF)
	sub($rmcol2 FS, "")

	# (x-NF) is to account for the change in number of fields after the previous field removal
	rmcol3 = Eam_rho_col - (x-NF)
	sub($rmcol3, "")
	
	# Printing the modified lines
	print $0
}}
