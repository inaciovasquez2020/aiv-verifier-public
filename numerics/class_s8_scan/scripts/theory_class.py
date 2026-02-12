from classy import Class

def compute_theory(w0, wa):
    cosmo = Class()

    params = {
        # Fluid dark energy
        "w0_fld": w0,
        "wa_fld": wa,
        "cs2_fld": 1.0,

        # DO NOT set any Omega_* for dark energy
        # CLASS will close the budget automatically

        # Outputs
        "output": "mPk",
        "P_k_max_1/Mpc": 5.0,
        "z_max_pk": 3.0,
    }

    # Hard guards (keep these)
    for forbidden in ["Omega_fld", "Omega_Lambda", "Omega_scf"]:
        assert forbidden not in params

    cosmo.set(params)
    cosmo.compute()

    sigma8 = cosmo.sigma8()
    Omega_m = cosmo.Omega_m()

    cosmo.struct_cleanup()
    cosmo.empty()

    return sigma8, Omega_m

