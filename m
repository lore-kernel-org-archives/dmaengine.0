Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D56A3ED107;
	Mon, 20 Jul 2026 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545307; cv=none; b=oT0NGxdW7hokgZ0dpq/c7kqhm6M0YwMppiQxqt1HH4u35+RwUZrQ+XR2c2oNXvQQtIH/VltybJ3NtFO0bwVhGtnMrj3Kt2cCs4ljrISuTlKs730N9WZXJv+VizkFc4SwJZFxoyms66YJDoQVkPc2QvVk1p8ueAb6X5FDwqvTJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545307; c=relaxed/simple;
	bh=Bb2eOimN0qbf0ShF5lAH/1mIjn73434I1oSjqoq7mJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fSw/NC8crlASadbLHv3o4t0d+UPwCMj7igxEBqKaigD1+ORv42vsUEWB64PPh61uQoXSTLoHb1udJ7kRzeBMsIBirXJSD9ki3xOhJ9NCu0XeuMwvfcItybl13wGJZqA87irQKPS9+UibJE16W4wr74wtZr45HfRGORMdwPbuWWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuFUaVuV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuFUaVuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBE81F00A3A;
	Mon, 20 Jul 2026 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784545305;
	bh=rpV+YwvvEQwqUzlenE5ehpa/Bk8xihrQ1s5VjGvxwYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CuFUaVuVP44UNh6Tj5pofltFQH3O2IRdCXepOw0lllBKR3UO8EEdEpzFIbHd48t/U
	 PoH+e0Eio1wyCtW6WzV59uK7YBc7W8BW9/YSSpLx7vhJqxyGSvHYfC92BbItZg742G
	 V8ACWMhVfQGUhdnxCewDALu0VncLv+c18gljwpNpiVKi/3nl0zwOMQL/kcDFCAWqwq
	 cBq2zX8C/4lKDl8EiyZHEb8xi709oCUO/Tp15J1iUdPU44qEYAPN8foF/2nJiWdIDR
	 lom0mG3tVM2S0W4taMN271UEwTUIxsHVz5uNuWFkYpBiJDGR4gPYQ1F2qcX6DvnCfG
	 i6MHc6+/m4Z+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/10] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
In-Reply-To: <20260720-shikra-dt-m1-v7-6-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-6-7dc99100c6dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:01:44 +0000
Message-Id: <20260720110145.8EBE81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect firmware path specified for the MPSS remote processor =
in `shikra-iqs-evk.dts`, using the `cqs` directory instead of `iqs`.
--

--- Patch [6]: [PATCH v7 06/10] arm64: dts: qcom: shikra: Enable CDSP, LPAI=
CP and MPSS on EVK boards ---
commit 63fe4aa2fa39f5559ca6adcfb17f05ea60b9924b
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boards

This commit enables CDSP, LPAICP, and MPSS for the Qualcomm Shikra CQM,
CQS, and IQS EVK boards by adding the appropriate remoteproc nodes and
firmware paths.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd7594..727809430fd15 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts

[ ... ]

> @@ -23,6 +23,25 @@ chosen {
>  	};
>  };
> =20
> +&remoteproc_cdsp {
> +	firmware-name =3D "qcom/shikra/cdsp.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_lpaicp {
> +	firmware-name =3D "qcom/shikra/lpaicp.mbn",
> +			"qcom/shikra/lpaicp_dtb.mbn";
> +
> +	status =3D "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name =3D "qcom/shikra/cqs/qdsp6sw.mbn";

[Severity: Medium]
Should this firmware path use iqs instead of cqs?

Since this node is in the shikra-iqs-evk.dts file, using the cqs directory
looks like a copy-paste error that might cause the modem remoteproc to fail
to load the correct firmware for the IQS board.

> +
> +	status =3D "okay";
> +};
> +
>  &sdhc_1 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-shikra-dt-=
m1-v7-0-7dc99100c6dd@oss.qualcomm.com?part=3D6
