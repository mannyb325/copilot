import pytest
from unittest.mock import patch
from point import print_names, print_random_name

class TestPrintNames:
    """Test cases for the print_names function."""
    
    def test_print_names_with_valid_list(self, capsys):
        """Test print_names with a valid list of names."""
        names = ['Alice', 'Bob', 'Charlie']
        print_names(names)
        
        captured = capsys.readouterr()
        expected_output = "Alice\nBob\nCharlie\n"
        assert captured.out == expected_output
    
    def test_print_names_with_empty_list(self, capsys):
        """Test print_names with an empty list."""
        names = []
        print_names(names)
        
        captured = capsys.readouterr()
        assert captured.out == ""
    
    def test_print_names_with_single_name(self, capsys):
        """Test print_names with a single name."""
        names = ['John']
        print_names(names)
        
        captured = capsys.readouterr()
        assert captured.out == "John\n"
    
    def test_print_names_with_special_characters(self, capsys):
        """Test print_names with names containing special characters."""
        names = ['José', 'O\'Connor', 'Mary-Jane']
        print_names(names)
        
        captured = capsys.readouterr()
        expected_output = "José\nO'Connor\nMary-Jane\n"
        assert captured.out == expected_output


class TestPrintRandomName:
    """Test cases for the print_random_name function."""
    
    @patch('random.choice')
    def test_print_random_name_mocked_choice(self, mock_choice, capsys):
        """Test print_random_name with mocked random.choice."""
        mock_choice.return_value = 'Alice'
        names = ['Alice', 'Bob', 'Charlie', 'David']
        
        print_random_name(names)
        
        captured = capsys.readouterr()
        assert captured.out == "Hello, Alice!\n"
        mock_choice.assert_called_once_with(names)
    
    def test_print_random_name_with_valid_list(self, capsys):
        """Test that print_random_name outputs a valid greeting."""
        names = ['Alice', 'Bob', 'Charlie', 'David']
        
        print_random_name(names)
        
        captured = capsys.readouterr()
        # Check that output starts with "Hello, " and ends with "!\n"
        assert captured.out.startswith("Hello, ")
        assert captured.out.endswith("!\n")
        
        # Extract the name from the output
        name_in_output = captured.out[7:-2]  # Remove "Hello, " and "!\n"
        assert name_in_output in names
    
    def test_print_random_name_with_single_name(self, capsys):
        """Test print_random_name with a single name."""
        names = ['John']
        
        print_random_name(names)
        
        captured = capsys.readouterr()
        assert captured.out == "Hello, John!\n"
    
    def test_print_random_name_multiple_calls_validity(self, capsys):
        """Test that multiple calls to print_random_name produce valid outputs."""
        names = ['Alice', 'Bob']
        
        for _ in range(10):  # Run multiple times to test randomness
            print_random_name(names)
            captured = capsys.readouterr()
            
            # Each output should be valid
            assert captured.out in ["Hello, Alice!\n", "Hello, Bob!\n"]
    
    def test_print_random_name_with_empty_list_raises_error(self):
        """Test that print_random_name raises an error with empty list."""
        names = []
        
        with pytest.raises(IndexError):
            print_random_name(names)
    
    @patch('random.choice')
    def test_print_random_name_different_names(self, mock_choice, capsys):
        """Test print_random_name with different mocked choices."""
        names = ['Alice', 'Bob', 'Charlie', 'David']
        
        # Test with different names
        test_cases = ['Alice', 'Bob', 'Charlie', 'David']
        
        for test_name in test_cases:
            mock_choice.return_value = test_name
            print_random_name(names)
            
            captured = capsys.readouterr()
            expected_output = f"Hello, {test_name}!\n"
            assert captured.out == expected_output


class TestIntegration:
    """Integration tests for the point.py module."""
    
    def test_names_list_is_valid(self):
        """Test that the names list contains expected values."""
        from point import names
        
        expected_names = ['Alice', 'Bob', 'Charlie', 'David']
        assert names == expected_names
        assert len(names) == 4
        assert all(isinstance(name, str) for name in names)
    
    def test_both_functions_work_with_names_list(self, capsys):
        """Test that both functions work correctly with the global names list."""
        from point import names
        
        # Test print_names
        print_names(names)
        captured = capsys.readouterr()
        expected_output = "Alice\nBob\nCharlie\nDavid\n"
        assert captured.out == expected_output
        
        # Test print_random_name
        print_random_name(names)
        captured = capsys.readouterr()
        
        # Verify the output format and that the name is from the list
        assert captured.out.startswith("Hello, ")
        assert captured.out.endswith("!\n")
        name_in_output = captured.out[7:-2]
        assert name_in_output in names


if __name__ == "__main__":
    pytest.main([__file__])
