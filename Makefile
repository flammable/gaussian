USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=gaussian
REVERSE_DOMAIN=com.gaussian
PACKAGE_VERSION=1.2.1
PAYLOAD=\
	pack-script-preinstall\
	pack-usr-local-outset-login-once-gaussian_setup.sh\
	pack-usr-local-outset-login-every-gaussian_cache_clean.sh\
	ungz-applications-gaussview\
	ungz-applications-gaussian09\
	pack-script-postinstall

ungz-applications-gaussview: l_Applications
	@sudo ${TAR} xjf gv-509-MacOSX-Intel.tgz -C ${WORK_D}/Applications
	@sudo chown -R root:admin "${WORK_D}/Applications/gv/"
	@sudo chmod -R 755 "${WORK_D}/Applications/gv/"

ungz-applications-gaussian09: l_Applications
	@sudo ${TAR} xjf M64-108X.tgz -C ${WORK_D}/Applications
	@sudo chown -R root:admin "${WORK_D}/Applications/g09/"
	@sudo chmod -R 755 "${WORK_D}/Applications/g09/"

munkiimport: dmg
		munkiimport \
--nointeractive \
--subdirectory apps \
--name "${TITLE}" \
--displayname "Gaussian" \
--description "Gaussian 09 is the latest in the Gaussian series of programs. It provides state-of-the-art capabilities for electronic structure modeling. Gaussian 09 is licensed for a wide variety of computer systems. All versions of Gaussian 09 contain every scientific/modeling feature, and none imposes any artificial limitations on calculations other than your computing resources and patience. GaussView is the most advanced and powerful graphical interface available for Gaussian. With GaussView, you can import or build the molecular structures that interest you, set up, launch, monitor and control Gaussian calculations, and retrieve and view the results, all without ever leaving the application. GaussView 5 includes many new features designed to make working with large systems of chemical interest convenient and straightforward. It also provides full support for all of the new modeling methods and features in Gaussian 09." \
--category "Sciences" \
--developer "Gaussian, Inc." \
--minimum_os_version "10.5.0" \
--requires "Add Gaussian User" \
--requires "outset" \
"${DMG_NAME}"