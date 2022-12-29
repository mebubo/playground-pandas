{ pkgs ? import <nixpkgs> {} }:

let

    python-with-packages = pkgs.python3.withPackages (p: [
        p.pandas
        p.wordfreq
        p.spacy
        p.jupyterlab
    ]);

in

    pkgs.mkShell {
        packages = [
            pkgs.jupyter
            python-with-packages
        ];
    }
