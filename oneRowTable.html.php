<table class="one_line_table">
    <thead>
        <?php foreach ($column_names as $val): ?>
            <th> <?php echo $val; ?></th>
        <?php endforeach; ?>
    </thead>
    <tbody>
        <?php foreach ($doctor as $row): ?>
            <tr>
                <?php foreach ($row as $val): ?>
                    <td> <?php echo $val; ?></td>
                <?php endforeach; ?>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>