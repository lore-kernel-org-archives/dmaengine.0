Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4856242D97;
	Thu,  1 Oct 2026 08:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845076; cv=none; b=enXghR7rLD1DKGMW3ZcSNR84bVePvUjoLqCZXr5EEMCrYvy8taI1TxAH958ZXgBh+maBvUaO+ETw+VZqUasctBpF1Vnpqs6t6HRm0jmsbp031Y6vtDlvGH/exs3lHf8hRGp80dWsEt5Yz1CIrDRBLJwWdp8tq38+TVeGwy3MAGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845076; c=relaxed/simple;
	bh=LTFXMCmY5PFIRL6B8d1uV4fkO2A+6EUTiR+vNLNm4hA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eCoKaBw6GADZr0wDqFN1OKOAUsc5i/7wXY/Weg43BuxjUfSjImrq2I7vPsXqUN+XeMwsXmOwTHpDppidV98/Di7ORqjItIRVM4mgO7b0nES3M4BT5iBn5XCX20O2fU8zRcGVgzm0FqZ4HmyZ7tISMSHyKdjkFnx0xVXFf1h6bFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6xju4g6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6xju4g6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE3A1F000FF;
	Thu,  1 Oct 2026 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790845075;
	bh=x3LaHs+4eQ9zSX3i9KKsQGp5Y72yZOZGKzCZCN5+OHo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J6xju4g6MLKnL7hIscnUu2Padgw5GjPcRKiHvgie3eoC2ahO3+HzhPLkm9qQnMgf3
	 GYLOsOCdixVFZkOWPz1guCmssVunCL8vT2uQm9UwGozgLKVF3Koax49lBs1BYnrXgw
	 SYKKgkHZmydOH4/SdQee9xZ8w4Qc9VgYyoGfGQF++HKA1kBz8gjCCIiIG502RzJ7lR
	 JLQHJDwC6MQSz89lRmJSOcTtKtnq5pCgUvcKltB6N/AvHuZgShVm8M+TSZrrRqAj1c
	 YzJZakIu4KjNyY2FTa5gG10Ye/Rgul0HHaFsfsCYuEnpcbdCE1DE5ooqnP/M3SzLY3
	 lCPiM9EM7BDCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on
 AM62x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20261001084105.1692228-2-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
 <20261001084105.1692228-2-s-adivi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 08:57:54 +0000
Message-Id: <20261001085754.CDE3A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: misleading commit message and invalid Fixes tag
--

commit bd206aee322a8bc9aa73f1f81b842b751453d7b0
Author: Vignesh Raghavendra <vigneshr@ti.com>

dmaengine: ti: k3-udma: Fix sporadic crash on AM62x

This commit zero-initializes the ring_init_data structure to prevent a
sporadic crash caused by garbage data on the stack.

> ring_init_data is declared on stack and thus can contain garbage which
> can lead to k3_ringacc_dmarings use junk address for ringrt base leading
> to below crash during ring pop
[ ... ]
> Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDM=
A")

[Severity: Medium]
Is this description and Fixes tag accurate for the code at this specific=20
commit?

The commit message states this fixes a crash caused by a junk address for t=
he
ringrt base. However, the base_rt field doesn't appear to be added to
struct k3_ringacc_init_data until Patch 12 of this series.

Could this lead to ineffective stable backports, given that the patch appea=
rs
to act as a placebo prior to Patch 12 being applied?

> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index 78a67cb9d6e00..8457644cb9132 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
>  	if (ud->match_data->type =3D=3D DMA_TYPE_UDMA) {
>  		ud->ringacc =3D of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc=
");
>  	} else {
> -		struct k3_ringacc_init_data ring_init_data;
> +		struct k3_ringacc_init_data ring_init_data =3D { 0 };
> =20
>  		ring_init_data.tisci =3D ud->tisci_rm.tisci;
>  		ring_init_data.tisci_dev_id =3D ud->tisci_rm.tisci_dev_id;

[Severity: Medium]
Does this zero-initialization actually change any behavior here?

Looking at udma_probe(), every existing field of this struct is explicitly
assigned immediately after the declaration:

		ring_init_data.tisci =3D ud->tisci_rm.tisci;
		ring_init_data.tisci_dev_id =3D ud->tisci_rm.tisci_dev_id;
		if (ud->match_data->type =3D=3D DMA_TYPE_BCDMA) {
			ring_init_data.num_rings =3D ud->bchan_cnt + ...
		} else {
			ring_init_data.num_rings =3D ud->rflow_cnt + ...
		}

Since all fields are explicitly initialized, wouldn't the uninitialized mem=
ory
issue only manifest after Patch 12 adds the base_rt field?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001084105.1692=
228-1-s-adivi@ti.com?part=3D1
