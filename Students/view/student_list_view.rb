require 'fox16'
include Fox
class StudentListView < FXVerticalFrame
    def initialize(parent)
        super(parent, opts: LAYOUT_FILL)
        setup_filtering_area
    end

    def setup_filtering_area
        filtering_area = FXVerticalFrame.new(self, opts: LAYOUT_FILL_X | LAYOUT_SIDE_TOP)
        FXLabel.new(filtering_area, "Фильтрация")
        FXHorizontalFrame.new(filtering_area, opts: LAYOUT_FILL_X) do |frame|
            FXLabel.new(frame, "Фамилия и инициалы:")
            FXTextField.new(frame, 20, opts: TEXTFIELD_NORMAL)
        end
        add_filtering_row(filtering_area, "Git:")
        add_filtering_row(filtering_area, "Email:")
        add_filtering_row(filtering_area, "Телефон:")
        add_filtering_row(filtering_area, "Telegram:")
    end
    
    def add_filtering_row(parent, label)
        FXHorizontalFrame.new(parent, opts: LAYOUT_FILL_X) do |frame|
            FXLabel.new(frame, label)
            combo_box = FXComboBox.new(frame, 3, opts: COMBOBOX_STATIC | FRAME_SUNKEN)
            combo_box.numVisible = 3
            combo_box.appendItem("Не важно")
            combo_box.appendItem("Да")
            combo_box.appendItem("Нет")
            text_field = FXTextField.new(frame, 15, opts: TEXTFIELD_NORMAL)
            text_field.enabled = false
            combo_box.connect(SEL_COMMAND){ text_field.enabled = (combo_box.currentItem == 1) }
        end
    end

end