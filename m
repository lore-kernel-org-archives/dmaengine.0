Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821840;
	b=2YIxZgXblNyKW9QIu1qK61n1Qbo29yhIiIHCk+ryvF5R36wyZsNntRtXK5QhJCDPdZLJ
	 N7R9Btzwj31ZIJROPGmxriSY0FhQQMlVRzzVqtWr2ETyVHDOOwsBP/1NC3VRXcY4Z51dw
	 4JIHGdSjAgA431u6bc5jXaGUpmg2lKOyAyjggt/cEzjmkSsQL/b/5rlpInMOH6PqCnhc7
	 sXdxc6aDrBPpj5tPAzVjoGeuqbSx8SeOEk5w84pqE0ARFDCbCf3bc2K7t5qZn6REbRQWu
	 GZ9RsTIfzBIf8oCnuga5YNVoTNRzbJc5Bo1hyPsLYIirIcwpX8rtkXgWrAmZT4Lkexg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:
	 References:In-Reply-To;
	bh=RsYO5R8L5LVg0yubVJzT2dh49z5DZCuj8vx/6J0uBsU=;
	b=m6kqd2MB8aWIAWV8i53d1hlAbQrSobNzUEd08qpvZRiTQIH2aI6MtpLuSmZADDIuNI3p
	 5lQbjjRy/d9XW6jHNNvZzcHMZUtCJdcVXKQXz6rj4KtWrsw+lsIEGXlMr/oO4SgMTeMmR
	 A6ElW+Kb5YEkk+8LzCB3TGutgN+5mAuutAEFmGKrKdcFMj8yD7bhFjpeBcAi+k2aa/BFn
	 CklqF8iNp7c1A5EF1IBNTNKbddkvNqLiESw7k9LfvgsibZOSKhrtzFh2EAWUsAnwjN7v8
	 nWwconQcGd+yywOf7FGIPmghvBw+V9Fa25g25QU8uLWgHK9TmVbOOyf0FcfqoV/3oGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MG27KUQM;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288460954DF
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 19:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4288460954DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MG27KUQM
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so673916f8f.1
        for <dmaengine@vger.kernel.org>; Wed, 04 Nov 2026 11:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793821837; x=1794426637; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RsYO5R8L5LVg0yubVJzT2dh49z5DZCuj8vx/6J0uBsU=;
        b=MG27KUQM5Y/sluPIHfuwpht8hFRunYBDE5XpEKeoFZ2Nv5z/+Wf45PB2N2B0pPIr0Y
         RYsxgVA/TUTEPjsDG+8GXB/moPjPPjDuskppEqeB7UnMD1K1eqfYfcIySKOKLK5dhE4q
         BQiG/CMBw0U7V7TWpJTrL9djiOSNE/3LQdzN+8ptvWyoxzwXafj7YHBndBR2lLyyzXw3
         l9rq+3X+tSVubUlh0BsgGTc8u1HvEoL2Qvc0dZaoye17n3WHG8HJ98j+ghBGLxEzcPgC
         9dC7CzKmSyUts81qRqw2m2m6T6i1YpTAr5FALmc1Uy/FgRNDbnffQ2g1hfAszgmd2pGd
         1JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821837; x=1794426637;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RsYO5R8L5LVg0yubVJzT2dh49z5DZCuj8vx/6J0uBsU=;
        b=Pq7oXVcH5jO5lOdb7wLM7Xk+UdA5BgwMPCxRBJbAen/UkJuALz1DoolVSBkG+ey+TJ
         2hR+BznjWPmDEX1sJzN1Cca6lKq3HDgKj4//ebajWFay8PP/4OOZmAfrra+zBSlCYag3
         y8aSwOtm3sfg7iuBUI2vLiaeiyydYeo5syWTn4LXxjJ/esf7wMeyXd99nG2Tn21r//ND
         43iG8GrKnmi1srwV1cV+Kpp7zb40R9yqXfsRCye+r0rmo6sby9oJhIdEP3A2Vtyscvfn
         5jOxYAeKJyRXhY7tGifwcPIYZ1fs6EI+f9HN4UYedwd+Zj9Z1XEeiJulxXD4PNPF9ao6
         dt+A==
X-Forwarded-Encrypted: i=1; AKwUvByHMcZ1NMcbi3a94xCCQMnfOD864vliUdBb8LiU3KzLe/9JJ/Lq4b0uSuVRTwpQrlIrxsCEv+j194Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z88pPWLAzehybhJCeXiOyR14ZcAKp/iVx8SgfE0NaGBU5HLzE83
	7uf4Ac690Z1+u1cYYfSaknRt5SuwSa5QlhTkEmaETLFR7AgVHPxOkOel62fBrZWq2efhXdwnLJU
	sYZNX
X-Gm-Gg: AYBFou0itwCsZAlvbMHEIzMTauD5pbUImembtvvxhb22ghuJU4fOwkeCd7ZTJpUeJPL
	PPjfP28Ar/zXp7M63lJStwPpGKbk+1osF0mgOD8sPH0+E4sC3/S13XcBLMAG/SyZxWTHujfYHXK
	MeKbszgp+w4idj6+vep3MVUz2nFXs2i5PM+Wy8r05bCD68XhhgqAzzFD421nl24fb3Ujr16qJXv
	mRojKmUxYoRVFwQFZBEy5B2gXvlGblVmrIg/ITTAPCeHLZ+aH6HXzvRyGJ5Hw0cD06jZKRoDAOs
	gJPkk/SLOzxs0+n/Agz/Jg3zcCH593hjDsyTQ+VTDQsdoqxdt6rEsSqvMvpm9C+agJoxRM0A3FC
	1ny3rsD1J+YpKPqkgxKyo/GaPmT9XXJpch2KN4W62smhRjDO7tA+LO2whVpixuoATSi26BRJd0f
	J25uCbPvimEIQ0E99xL02Ph2xTjpcK2BrCMO0UfjsT3YDnxrBu8IJJiNP2rtJ7oKOPnJuY6gwRp
	E3z9i39qztri7Ulk+rROIV4Whn+HUW77ZiT6PUVanVctRHYtRezBmHN9iTpvEQOag8Pb99mUIuy
	m+koG5zt2atKGNMNh1ryC+Na51pSEutBH4KgyDhba+cCBk0=
X-Received: by 2002:a05:6000:4021:b0:48d:e6f6:21cf with SMTP id ffacd0b85a97d-48e6e306900mr38286580f8f.31.1793821837378;
        Wed, 04 Nov 2026 11:50:37 -0800 (PST)
Received: from localhost ([2001:4090:a244:81d0:bc85:7836:468a:a1a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed5538basm5325940f8f.44.2026.11.04.11.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:50:36 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ee0b8d44e90725828066b8930e0f6189120bcd9f47cbb7b5da9d5a8229c3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Nov 2026 20:50:28 +0100
Message-Id: <DMMORNOEOVC1.W8WMKFFWRVGU@baylibre.com>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Daniel Mack" <zonque@gmail.com>,
 <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Julien Panis"
 <jpanis@baylibre.com>, "Mendez, Judith" <jm@ti.com>, "Francis, Sebin"
 <sebin.francis@ti.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH 1/4] dmaengine: ti: cppi41: Use td_queue to restore
 DMA_TDFDQ
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Frank Li" <Frank.li@oss.nxp.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20261103-v7-3-topic-am335lpm-cppi41-v1-0-d7213446c5f5@baylibre.com> <20261103-v7-3-topic-am335lpm-cppi41-v1-1-d7213446c5f5@baylibre.com> <autue--8pip-cNQk@SMW015318>
In-Reply-To: <autue--8pip-cNQk@SMW015318>

--ee0b8d44e90725828066b8930e0f6189120bcd9f47cbb7b5da9d5a8229c3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 4, 2026 at 6:42 PM CET, Frank Li wrote:
> On Tue, Nov 03, 2026 at 08:37:28PM +0100, Markus Schneider-Pargmann (TI) =
wrote:
>> [You don't often get email from msp@baylibre.com. Learn why this is impo=
rtant at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> In init_cppi41() td_queue.submit is used to setup DMA_TDFDQ. In
>> suspend/resume the same value is read, stored and restored.
>>
>> To get rid of the suspend register access, use td_queue.submit in resume
>> as well to restore the value.
>>
>> Cc: stable@vger.kernel.org
>
> Do you fix some problem? why only have cc stable without fixes tag?

This in itself does not fix an issue. But without removing the register
read in suspend the follow up patch would not be enough to make it work.

Best
Markus

--ee0b8d44e90725828066b8930e0f6189120bcd9f47cbb7b5da9d5a8229c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCauuMhRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOZ
tQEAk5I87cijSBP2K97rUA3N6Qdsw4NGsd6NwNNQXdTFSOEA/Ay25+LZG9HzW52x
Y0gRoHYQHeAJZpoTQz9sRHXM0LwE
=sNxU
-----END PGP SIGNATURE-----

--ee0b8d44e90725828066b8930e0f6189120bcd9f47cbb7b5da9d5a8229c3--
