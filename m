Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521750;
	b=TZDHrdaixYMp0n5DY5hTxw1qxUXV+fUjoS//yEu/uVnP7jo8l12fnLbWg4XbSOyfVbak
	 Wmm+9/pR2Gn1f1In4cxI46v79uEmufuet3GNMPqGUPx9Dr4Ft1Z2UHK2nUeq7tlrg1KAj
	 NJbyEH+NZ1lN2/cx2jlC6JE2TGR/ezPsHmm50mMaAntECWt8shYDnqOCqfmIs7eZZpa2B
	 9wSm7VMTtI33Esgx7wvHIo5AKQKL/afBgOw/pOAXock/CBilgmXyvwAQd99imue6dSdBQ
	 M3pQIL2GYUTnI2k2xZgMtzxwpkNX5VaMplU3GP+PyPBr1Uywt3JQN7oJwzQpQguEtgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521750;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nJoZtz+K03vPlG5DUlRzuLgIA8XxEHB0cIfFEcKZ16U=;
	b=A6TJEIMRRAUFSoXDhxtG2Q7DCij/gIBGz+GPjHyIQwukz2FVb5Eft+ULEoFWLOCO8kcV
	 9jhNUEJC4YKmP4cX7mBD1uZBtscmypZCefhy6DvMnfjsLwAd0UcDsNfdPrsgsC2pJg0nO
	 UbuKAM/R9qaa8p6dXS3sUjXTpCDT6lWfwcjEroB1sRKMcxmM6FH9aQJaiaFvRz7nCGBlZ
	 oXokAVIV6XrQolsXW3a3hhCZEvr1PqC1zdHOAEpz9r0sjvmhNVthgCge7oaWlwDuAitKj
	 D4BSXSQvievdEWdvyJ0za8Diz/Rz8koxveTbYbDGUPF2Bn+577hvfIr00dVidIFSZNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghQjpRCG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EEE606A31E;
	Tue, 24 Nov 2026 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghQjpRCG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7891F000D1;
	Tue, 24 Nov 2026 12:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521750;
	bh=nJoZtz+K03vPlG5DUlRzuLgIA8XxEHB0cIfFEcKZ16U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ghQjpRCGnaXdTrxd04NTgplhiwZpsYy5Kva6cIMZSCgr/Mh3SyH5PcfHveXEILqkw
	 TGMSlBA2gJFxBpGYU7PUMGIYzVFNzuR7pXyimgVAUbvKpUHTdCqYlIjMCVrVEHob8z
	 2wCWDrHdxuVjER2SX5gifF3nRikvJvk/pwTT6HfJYzzZhZPXp5SmQDUMJUaqS3Ok6b
	 BQpa6SsbbI3DMzyV5FEjzvHKJlZfDO4J1eaDOd1UQ7w8d8S0xleB6u7cRChioUjTuV
	 IVIqkbmiJckK5+H6Cyrj1p++JW9eOIAD1e9FqaQBBDwiZN6XWhTs1ay1N7aTtTiTqP
	 eDkzP5c9qnQgg==
Message-ID: <sashiko-outbox-231087@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 16/20] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL
 and PDMA data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sai Sree Kartheek Adivi" <s-adivi@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261124-dma-upstream-v13-v13-16-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
 <20261124-dma-upstream-v13-v13-16-bd4251fdc6d4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:02:29 +0000
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dmaengine: ti: k3-psil: missing kernel-doc for PSIL_EP_PDMA_XYMF
  and fifo_id
--

commit 36b10256346d6e76d4076712b956eb916cdbb147
Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data

This commit adds PSIL and PDMA endpoint configuration data for the AM62Lx S=
oC
and introduces the PSIL_EP_PDMA_XYMF endpoint type with a fifo_id field for
multi-FIFO channels.

> diff --git a/include/linux/dma/k3-psil.h b/include/linux/dma/k3-psil.h
> index 5f106d852f1cf..36e347311f8b2 100644
> --- a/include/linux/dma/k3-psil.h
> +++ b/include/linux/dma/k3-psil.h
> @@ -35,6 +35,7 @@ enum udma_tp_level {
>  enum psil_endpoint_type {
>  	PSIL_EP_NATIVE =3D 0,
>  	PSIL_EP_PDMA_XY,
> +	PSIL_EP_PDMA_XYMF,
>  	PSIL_EP_PDMA_MCAN,
>  	PSIL_EP_PDMA_AASRC,
>  };
> @@ -78,6 +79,8 @@ struct psil_endpoint_config {
>  	u16 flow_start;
>  	u16 flow_num;
>  	s16 default_flow_id;
> +	/* XYMF FIFO index (0-3 for CS0-CS3), Only for PSIL_EP_PDMA_XYMF */
> +	u8 fifo_id;
>  };

[Severity: Low]
Both enum psil_endpoint_type and struct psil_endpoint_config have kernel-doc
comment blocks above them, so adding PSIL_EP_PDMA_XYMF and fifo_id without
matching @PSIL_EP_PDMA_XYMF and @fifo_id entries causes scripts/kernel-doc
(and W=3D1 builds) to emit warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-dma-upstre=
am-v13-v13-0-bd4251fdc6d4@ti.com?part=3D16
