package v1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// EDIT THIS FILE!  THIS IS SCAFFOLDING FOR YOU TO OWN!
// NOTE: json tags are required.  Any new fields you add must have json tags for the fields to be serialized.

// LanguageSpec defines the desired state of Language
// +k8s:openapi-gen=true
type LanguageSpec struct {
	Input string `json: "input"`
}

// LanguageStatus defines the observed state of Language
// +k8s:openapi-gen=true
type LanguageStatus struct {
	// INSERT ADDITIONAL STATUS FIELD - define observed state of cluster
	// Important: Run "operator-sdk generate k8s" to regenerate code after modifying this file
	// Add custom validation using kubebuilder tags: https://book.kubebuilder.io/beyond_basics/generating_crd.html
}

// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// Language is the Schema for the languages API
// +k8s:openapi-gen=true
type Language struct {
	metav1.TypeMeta   `json:",inline"`
	metav1.ObjectMeta `json:"metadata,omitempty"`

	Spec   LanguageSpec   `json:"spec,omitempty"`
	Status LanguageStatus `json:"status,omitempty"`
}

// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// LanguageList contains a list of Language
type LanguageList struct {
	metav1.TypeMeta `json:",inline"`
	metav1.ListMeta `json:"metadata,omitempty"`
	Items           []Language `json:"items"`
}

func init() {
	SchemeBuilder.Register(&Language{}, &LanguageList{})
}
