#!/usr/bin/awk

# Filters out the only header portion of the file
{if( $1 ~ /^#/ ) {
	# identifies the field number of the columns to be processed for further use
	if( $1 ~ /^#C/ ) {

		for ( i=1; i <= NF; i++ ) {
			if ( $i == "type" ) { Type_col=i }
			if ( $i == "mass" ) { Mass_col=i }
			if ( $i == "eam_rho" ) { Eam_rho_col=i }
		}

		# x stores the original number of columns in the line before starting to remove the fields
		x = NF

		# (x-NF) accounts for the change in total no of columns after the previous removal of fields
		rmcol1 = Type_col - (x-NF)
		sub($rmcol1 FS, "")

		# (x-NF) accounts for the change in total no of columns after the previous removal of fields
		rmcol2 = Mass_col - (x-NF)
		sub($rmcol2 FS, "")

		# (x-NF) accounts for the change in total no of columns after the previous removal of fields
		rmcol3 = Eam_rho_col - (x-NF)
		sub($rmcol3, "")
		}

	# Scaling the dimension box in header to Angstrom (0.1) 
	if( $1 ~ /^#[XYZ]/ ) {
		$2 = $2 * 0.1
		$2 = sprintf("%.16e", $2)
		$3 = $3 * 0.1
		$3 = sprintf("%.16e", $3)
		$4 = $4 * 0.1
		$4 = sprintf("%.16e", $4)
		}
	# Printing the modified lines
	print $0
	}}
