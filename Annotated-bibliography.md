
# Annotated Bibliography <!-- omit in toc -->

A collection of papers and articles related to extraordinary access.

## Contents <!-- omit in toc -->

- [Technical Papers](#technical-papers)
  - [Key Recovery: Inert and Public](#key-recovery-inert-and-public)
  - [Making Decryption Accountable](#making-decryption-accountable)
  - [How to Share a Secret](#how-to-share-a-secret)
- [Policy Papers](#policy-papers)
  - [Privacy Versus Security... Are We Done Yet?](#privacy-versus-security-are-we-done-yet)
  - [On the Incommensurability of Laws and Technical Mechanisms: Or, What Cryptography Can't Do](#on-the-incommensurability-of-laws-and-technical-mechanisms-or-what-cryptography-cant-do)
- [Journalism](#journalism)

<!-- How to organize? By medium? By focus? -->

## Technical Papers

### Key Recovery: Inert and Public

- Summary:
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:

```bib
@InProceedings{10.1007/978-3-319-61273-7_6,
author="Boyd, Colin
and Boyen, Xavier
and Carr, Christopher
and Haines, Thomas",
editor="Phan, Rapha{\"e}l C.-W.
and Yung, Moti",
title="Key Recovery: Inert and Public",
booktitle="Paradigms in Cryptology -- Mycrypt 2016. Malicious and Exploratory Cryptology",
year="2017",
publisher="Springer International Publishing",
address="Cham",
pages="111--126",
abstract="We propose a public key infrastructure framework, inspired by modern distributed
cryptocurrencies, that allows for tunable key escrow, where the availability of key escrow is only
provided under strict conditions and enforced through cryptographic measures. We argue that any key
escrow scheme designed for the global scale must be both inert---requiring considerable effort to
recover a key---and public---everybody should be aware of all key recovery attempts. To this end,
one of the contributions of this work is an abstract design of a proof-of-work scheme that
demonstrates the ability to recover a private key for some generic public key scheme. Our framework
represents a new direction for key escrow, seeking an acceptable compromise between the demands for
control of cryptography on the Internet and the fundamental rights of privacy, which we seek to
align by drawing parallels to the physical world.",
isbn="978-3-319-61273-7"
}
```

### Making Decryption Accountable

- Summary:
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:

```bib
@InProceedings{10.1007/978-3-319-71075-4_11,
author="Ryan, Mark D.",
editor="Stajano, Frank
and Anderson, Jonathan
and Christianson, Bruce
and Maty{\'a}{\v{s}}, Vashek",
title="Making Decryption Accountable",
booktitle="Security Protocols XXV",
year="2017",
publisher="Springer International Publishing",
address="Cham",
pages="93--98",
abstract="Decryption is accountable if the users that create ciphertexts can gain information about
the circumstances of the decryptions that are later obtained. We describe a protocol that forces
decryptors to create such information. The information can't be discarded or suppressed without
detection. The protocol relies on a trusted hardware device. We describe some applications.",
isbn="978-3-319-71075-4"
}
```

### How to Share a Secret

- Summary:
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:

```bib
@article{Shamir:1979:SS:359168.359176,
author = {Shamir, Adi},
title = {How to Share a Secret},
journal = {Commun. ACM},
issue_date = {Nov. 1979},
volume = {22},
number = {11},
month = nov,
year = {1979},
issn = {0001-0782},
pages = {612--613},
numpages = {2},
abstract = "In this paper we show how to divide data D into n pieces in such a way that D is easily
reconstructable from any k pieces, but even complete knowledge of k - 1 pieces reveals absolutely no
information about D. This technique enables the construction of robust key management schemes for
cryptographic systems that can function securely and reliably even when misfortunes destroy half the
pieces and security breaches expose all but one of the remaining pieces.",
url = {http://doi.acm.org/10.1145/359168.359176},
doi = {10.1145/359168.359176},
acmid = {359176},
publisher = {ACM},
address = {New York, NY, USA},
keywords = {cryptography, interpolation, key management},
}
```

## Policy Papers

### Privacy Versus Security... Are We Done Yet?

- Summary:
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:

```bib
@Inbook{Stalla-Bourdillon2014,
author="Stalla-Bourdillon, Sophie",
title="Privacy Versus Security{\ldots} Are We Done Yet?",
bookTitle="Privacy vs. Security",
year="2014",
publisher="Springer London",
address="London",
pages="1--90",
abstract="It is often assumed that privacy and security are alternative values, which cannot be
pursued together. Hence, the strength of the ``nothing-to-hide argument'': if you have nothing to
hide, you have nothing to fear. Besides, ensuring the security of the network itself is said to
actually require a detailed analysis of network flows. Reasonable expectations of privacy should
thus progressively disappear in cyberspace. While it is true that enforcement of legal rules is a
real challenge when communications are transmitted through the means of a borderless network, the
evolution of the case law of the European Court of Human Right recently followed by the Court of
Justice of the European Union does show that the right to respect for private life should have
important implications online and in particular should significantly restrict the systematic
collection and retention of content and traffic data by both public and private actors such as
Internet service providers. At a time at which data-gathering and data-matching technologies are
more sophisticated than ever, as illustrated by Snowden's revelations, it is crucial to fully
comprehend the interaction between the protection of privacy and the furtherance of security in
order to set appropriate limits to surveillance practices. The purpose of this chapter is therefore
twofold: first, to shed light upon the European approach to privacy and explain the interplay
between privacy law, data protection law and data retention law; second, to explain how the values
of privacy and security should be balanced together and in particular how privacy law should serve
to scrutinise the appropriateness of measures implemented to ensure the security of the social group
at large.",
isbn="978-1-4471-6530-9",
doi="10.1007/978-1-4471-6530-9_1",
url="https://doi.org/10.1007/978-1-4471-6530-9_1"
}
```

### On the Incommensurability of Laws and Technical Mechanisms: Or, What Cryptography Can't Do

```bib
@InProceedings{10.1007/978-3-030-03251-7_31,
author="Feigenbaum, Joan
and Weitzner, Daniel J.",
editor="Maty{\'a}{\v{s}}, Vashek
and {\v{S}}venda, Petr
and Stajano, Frank
and Christianson, Bruce
and Anderson, Jonathan",
title="On the Incommensurability of Laws and Technical Mechanisms: Or, What Cryptography Can't Do",
booktitle="Security Protocols XXVI",
year="2018",
publisher="Springer International Publishing",
address="Cham",
pages="266--279",
abstract="We examine several technology-policy debates in which technical and legal perspectives are
so at odds that they approach incommensurability. Investigating the use of digital rights management
systems in the online-copyright debate and the dispute over the impact of end-to-end encryption on
lawful surveillance, we offer an analysis of the source of this incommensurability. In these two
policy debates, both sides invoke the rule of law to support their position, but in each case they
draw selectively from the constituent parts of the rule of law, resulting in seemingly
irreconcilable differences. We show that the rule of law is actually composed of rules (susceptible
to deterministic evaluation against a set of facts) and principles (expressing important values but
not susceptible to purely formal evaluation). The clash between rules and principles exacerbates the
difference in perspective between system designers, who favor formal rules, and policy makers, who
are more comfortable with situational application of principles. Following our observation that the
rules-principles gap makes for incommensurate debate between legal and technical actors, we identify
steps that each discipline can take to move toward more coherent policy for the networked, digital
environment.",
isbn="978-3-030-03251-7"
}
```

## Journalism

## Template <!-- omit in toc -->

### Title <!-- omit in toc -->

- Summary:
- Purpose:
- Premises:
- Contributions:
- Policy comments:
- Technical comments:
- Notes:

```bib
% BibTex style citation
```