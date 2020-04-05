protocol CodeView {
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupViews()
}

extension CodeView {
    func setupViews() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() { }
}
