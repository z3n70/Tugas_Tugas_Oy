import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class BiodataForm extends JFrame {
    private JLabel lblNama, lblNim, lblJurusan, lblAlamat, lblTanggalLahir;
    private JTextField txtNama, txtNim, txtJurusan, txtAlamat, txtTanggalLahir;
    private JLabel lblMataKuliah;
    private JCheckBox matkul_Matematika, matkul_OOP, matkul_Agama, matkul_Database, matkul_Inggris,
            matkul_SoftwareEngineer;
    private JButton btnSimpan;

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

        lblNim = new JLabel("NPM");
        lblNim.setBounds(20, 60, 80, 25);
        add(lblNim);

        txtNim = new JTextField();
        txtNim.setBounds(120, 60, 200, 25);
        add(txtNim);

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

        setVisible(true);
    }

    public static void main(String[] args) {
        new BiodataForm();
    }
}