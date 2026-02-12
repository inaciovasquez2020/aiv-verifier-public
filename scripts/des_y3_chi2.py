import numpy as np
from astropy.io import fits

FITS_PATH = "data/des_y3/DES_Y3_3x2pt.fits"
N_COSMO = 480   # DES Y3 3×2pt data length

def load_des_y3():
    hdul = fits.open(FITS_PATH)

    data = None
    cov_full = None

    for h in hdul:
        if h.data is None:
            continue

        # Identify data vector (1D, length ~480)
        if hasattr(h.data, "shape") and len(h.data.shape) == 1:
            if h.data.shape[0] == N_COSMO:
                data = np.array(h.data)

        # Identify full covariance (square, ~1000×1000)
        if hasattr(h.data, "shape") and len(h.data.shape) == 2:
            if h.data.shape[0] == h.data.shape[1] and h.data.shape[0] > N_COSMO:
                cov_full = np.array(h.data)

    hdul.close()

    if data is None or cov_full is None:
        raise RuntimeError("Failed to locate DES Y3 data or covariance")

    # Project to cosmology block
    cov = cov_full[:N_COSMO, :N_COSMO]

    return data, cov


def chi2(model_vec):
    data, cov = load_des_y3()
    diff = data - model_vec
    icov = np.linalg.inv(cov)
    return float(diff @ icov @ diff)


if __name__ == "__main__":
    data, cov = load_des_y3()
    print("N =", data.size)
    print("Cov shape =", cov.shape)
