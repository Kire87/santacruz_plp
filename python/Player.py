class Player:
    def __init__(self, name, number, position, alt_positions=None):
        self.name = name
        self.number = number
        self.position = position
        self.alt_positions = alt_positions or []