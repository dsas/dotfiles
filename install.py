#!/usr/bin/env python

# Install the files contained in this dir as symlinks
# NIH'd from https://github.com/holman/dotfiles/
# It's quick and dirty.

import glob, os, shutil


def symlink_file(from_file, to_file):
	to_exists = os.path.exists(to_file)
	if not to_exists:
		create_symlink = True
	elif not os.path.samefile(to_file, from_file):
		# files are different files, ask the user
		while True:
			raw_overwrite = raw_input("%(to_file)s already exists. Overwrite y/n " % {"to_file": to_file})
			if len(raw_overwrite) == 1 and (raw_overwrite == 'y' or raw_overwrite == 'n'):
				create_symlink = raw_overwrite == 'y'
				break
	else:
		create_symlink = False

	if create_symlink:
		if to_exists:
			try:
				if os.path.isfile(to_file) or os.path.islink(to_file):
					os.unlink(to_file)
				elif os.path.isdir(to_file):
					shutil.rmtree(to_file)
			except:
				print "Could not remove %(file)s not symlinking" % {"file": to_file}
				return False
		try:
			os.symlink(from_file, to_file)
		except:
			print "Could not symlink %(from)s to %(to)s" % {"from": from_file, "to": to_file}
			return False
	return True

home_dir = os.getenv('HOME') + '/'

for from_file in glob.glob('*.symlink'):
	to_file = "%(home)s.%(tofile)s" % {"home": home_dir, "tofile": from_file.replace(".symlink", "")}
	full_from_file = os.getcwd() + '/' + from_file

	symlink_file(full_from_file, to_file)

if os.path.exists(home_dir + 'bin'):
	bin_dir = home_dir + 'bin/'
else:
	bin_dir = home_dir + '.bin/'

if not os.path.exists(bin_dir):
	os.makedirs(bin_dir)

for root, dirs, files in os.walk('bin'):
	for from_file in files:
		to_file = bin_dir + from_file
		full_from_file = os.getcwd() + '/bin/' + from_file

		symlink_file(full_from_file, to_file)
