void main() {
	final costoConIva = (double precio) => precio * 1.12;
	print(costoConIva(100.0));

	final aplicarDescuento = (double precio, double pct) {
		final descuento = precio * (pct / 100);
		return precio - descuento;
	};
	print(aplicarDescuento(150.0, 10.0));

	final tiempos = [45, 30, 60, 20, 90];
	tiempos.sort((a, b) => a.compareTo(b));
	print(tiempos);
}
