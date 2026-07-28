import { ReactNode } from 'react'
import { Text, View, StyleSheet } from 'react-native'
interface CardProps {
  subtitulo?: string
  children: ReactNode       // cualquier JSX válido
  titulo: string
}

export default function Card({ titulo, subtitulo, children }: CardProps) {
  return (
    <View style={styleCard.card}>
      <View style={styleCard.cardCabecera}>
        <Text style={styleCard.cardTitulo}>{titulo}</Text>
        {subtitulo && (
          <Text style={styleCard.cardSubtitulo}>{subtitulo}</Text>
        )}
      </View>
      <View style={styleCard.cardCuerpo}>{children}</View>
    </View>
  )
}

const styleCard = StyleSheet.create({
  card: {
    backgroundColor: '#ffffff',
    borderRadius: 12,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOpacity: 0.07,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
    elevation: 3,
  },
  cardCabecera: {
    backgroundColor: '#1565c0',
    paddingHorizontal: 16,
    paddingVertical: 12,
    gap: 2,
  },
  cardTitulo: {
    fontSize: 16,
    fontWeight: '700',
    color: '#ffffff',
  },
  cardSubtitulo: {
    fontSize: 12,
    color: '#bbdefb',
  },
  cardCuerpo: {
    padding: 12,
    gap: 8,
  },
  fila: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
})