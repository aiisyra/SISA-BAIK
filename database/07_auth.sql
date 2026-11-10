BEGIN;

-- Tambahan kolom Autentikasi & RBAC (Chapter 8)
ALTER TABLE pengguna
ADD COLUMN IF NOT EXISTS kata_sandi VARCHAR(255),
ADD COLUMN IF NOT EXISTS versi_token INT NOT NULL DEFAULT 0 CHECK (versi_token >= 0);

ALTER TABLE penyedia
ADD COLUMN IF NOT EXISTS status_verifikasi VARCHAR(20) NOT NULL DEFAULT 'menunggu'
CHECK (status_verifikasi IN ('menunggu', 'terverifikasi', 'ditolak'));

COMMIT;