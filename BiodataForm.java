import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class BiodataForm extends JFrame {
    private JLabel lblNama, lblNpm, lblJurusan, lblAlamat, lblTanggalLahir;
    private JTextField txtNama, txtNpm, txtJurusan, txtAlamat, txtTanggalLahir;
    private JLabel lblMataKuliah;
    private JCheckBox matkul_Matematika, matkul_OOP, matkul_Agama, matkul_Database, matkul_Inggris,
            matkul_SoftwareEngineer;
    private JButton btnSimpan, btnTampilkan;
    private ArrayList<Biodata> biodataList;
    private DefaultListModel<String> listModel;

    public BiodataForm() {
        setTitle("Form Biodata Mahasiswa");
        setSize(400, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        lblNama = new JLabel("Nama");
        lblNama.setBounds(20, 20, 80, 25);
        add(lblNama);

        txtNama = new JTextField();
        txtNama.setBounds(120, 20, 200, 25);
        add(txtNama);

        lblNpm = new JLabel("NPM");
        lblNpm.setBounds(20, 60, 80, 25);
        add(lblNpm);

        txtNpm = new JTextField();
        txtNpm.setBounds(120, 60, 200, 25);
        add(txtNpm);

        lblJurusan = new JLabel("Jurusan");
        lblJurusan.setBounds(20, 100, 80, 25);
        add(lblJurusan);

        txtJurusan = new JTextField();
        txtJurusan.setBounds(120, 100, 200, 25);
        add(txtJurusan);

        lblAlamat = new JLabel("Alamat");
        lblAlamat.setBounds(20, 140, 80, 25);
        add(lblAlamat);

        txtAlamat = new JTextField();
        txtAlamat.setBounds(120, 140, 200, 25);
        add(txtAlamat);

        lblTanggalLahir = new JLabel("Tanggal Lahir");
        lblTanggalLahir.setBounds(20, 180, 80, 25);
        add(lblTanggalLahir);

        txtTanggalLahir = new JTextField();
        txtTanggalLahir.setBounds(120, 180, 200, 25);
        add(txtTanggalLahir);

        lblMataKuliah = new JLabel("Mata Kuliah");
        lblMataKuliah.setBounds(20, 220, 80, 25);
        add(lblMataKuliah);

        matkul_Matematika = new JCheckBox("Matematika");
        matkul_Matematika.setBounds(120, 220, 100, 25);
        add(matkul_Matematika);

        matkul_OOP = new JCheckBox("OOP");
        matkul_OOP.setBounds(240, 220, 80, 25);
        add(matkul_OOP);

        matkul_Agama = new JCheckBox("Agama");
        matkul_Agama.setBounds(120, 260, 100, 25);
        add(matkul_Agama);

        matkul_Database = new JCheckBox("Database");
        matkul_Database.setBounds(240, 260, 100, 25);
        add(matkul_Database);

        matkul_Inggris = new JCheckBox("Inggris");
        matkul_Inggris.setBounds(120, 300, 100, 25);
        add(matkul_Inggris);

        matkul_SoftwareEngineer = new JCheckBox("Software Engineer");
        matkul_SoftwareEngineer.setBounds(240, 300, 150, 25);
        add(matkul_SoftwareEngineer);

        btnSimpan = new JButton("Simpan");
        btnSimpan.setBounds(150, 340, 100, 30);
        add(btnSimpan);

        btnTampilkan = new JButton("Tampilkan");
        btnTampilkan.setBounds(260, 340, 100, 30);
        add(btnTampilkan);

        biodataList = new ArrayList<>();
        listModel = new DefaultListModel<>();

        btnSimpan.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nama = txtNama.getText();
                String npm = txtNpm.getText();
                String jurusan = txtJurusan.getText();
                String alamat = txtAlamat.getText();
                String tanggalLahir = txtTanggalLahir.getText();
                ArrayList<String> mataKuliah = new ArrayList<>();

                if (matkul_Matematika.isSelected()) {
                    mataKuliah.add("Matematika");
                }
                if (matkul_OOP.isSelected()) {
                    mataKuliah.add("OOP");
                }
                if (matkul_Agama.isSelected()) {
                    mataKuliah.add("Agama");
                }
                if (matkul_Database.isSelected()) {
                    mataKuliah.add("Database");
                }
                if (matkul_Inggris.isSelected()) {
                    mataKuliah.add("Inggris");
                }
                if (matkul_SoftwareEngineer.isSelected()) {
                    mataKuliah.add("Software Engineer");
                }

                Biodata biodata = new Biodata(nama, npm, jurusan, alamat, tanggalLahir, mataKuliah);
                biodataList.add(biodata);
                listModel.addElement(nama);

                JOptionPane.showMessageDialog(null, "Biodata tersimpan!");
                clearFields();

                StringBuilder sb = new StringBuilder();
                for (Biodata data : biodataList) {
                    sb.append(data.getNama()).append("\n---------\n");
                    sb.append("Npm: ").append(data.getNpm()).append("\n");
                    sb.append("Jurusan: ").append(data.getJurusan()).append("\n");
                    sb.append("Alamat: ").append(data.getAlamat()).append("\n");
                    sb.append("Tanggal Lahir: ").append(data.getTanggalLahir()).append("\n");
                    sb.append("Mata Kuliah: ").append(data.getMataKuliah()).append("\n\n");
                }

                JOptionPane.showMessageDialog(null, sb.toString());
            }
        });

        btnTampilkan.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFrame frame = new JFrame("Daftar Biodata");
                frame.setSize(400, 400);
                frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
                frame.setLayout(new BorderLayout());

                JList<String> biodataJList = new JList<>(listModel);

                JButton btnHapus = new JButton("Hapus");
                btnHapus.addActionListener(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        int selectedIndex = biodataJList.getSelectedIndex();
                        if (selectedIndex != -1) {
                            biodataList.remove(selectedIndex);
                            listModel.remove(selectedIndex);
                            JOptionPane.showMessageDialog(null, "Biodata dihapus!");
                        }
                    }
                });

                JPanel panel = new JPanel(new BorderLayout());
                panel.add(new JScrollPane(biodataJList), BorderLayout.CENTER);
                panel.add(btnHapus, BorderLayout.SOUTH);

                frame.add(panel);
                frame.setVisible(true);
            }
        });

        setVisible(true);
    }

    private void clearFields() {
        txtNama.setText("");
        txtNpm.setText("");
        txtJurusan.setText("");
        txtAlamat.setText("");
        txtTanggalLahir.setText("");
        matkul_Matematika.setSelected(false);
        matkul_OOP.setSelected(false);
        matkul_Agama.setSelected(false);
        matkul_Database.setSelected(false);
        matkul_Inggris.setSelected(false);
        matkul_SoftwareEngineer.setSelected(false);
    }

    public static void main(String[] args) {
        new BiodataForm();
    }
}

class Biodata {
    private String nama;
    private String npm;
    private String jurusan;
    private String alamat;
    private String tanggalLahir;
    private ArrayList<String> mataKuliah;

    public Biodata(String nama, String npm, String jurusan, String alamat, String tanggalLahir,
            ArrayList<String> mataKuliah) {
        this.nama = nama;
        this.npm = npm;
        this.jurusan = jurusan;
        this.alamat = alamat;
        this.tanggalLahir = tanggalLahir;
        this.mataKuliah = mataKuliah;
    }

    public String getNama() {
        return nama;
    }

    public String getNpm() {
        return npm;
    }

    public String getJurusan() {
        return jurusan;
    }

    public String getAlamat() {
        return alamat;
    }

    public String getTanggalLahir() {
        return tanggalLahir;
    }

    public ArrayList<String> getMataKuliah() {
        return mataKuliah;
    }
}
