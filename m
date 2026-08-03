Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFEB3BCD17;
	Mon,  3 Aug 2026 11:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756821; cv=none; b=m2Wynu0z8puCItkuM7HiBDH9Mqb6jtgAcEn8tgIqEz66CRdhMUOFtU1HuJT6i6nSeBBcsGKQCzeoI4DyW3g+iY+f34AJFYbXupPoK6Dm9pYvtxKSpvZGSP7NTBWBy/TWc7fIMOBt8YAs5wnqYxF+lWNNKsQIZGi3exviPIyf05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756821; c=relaxed/simple;
	bh=gWqY3iMRo7WeIZW407m2z+74AKAQT8S5NisGhU3F/Fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VLsezstCX309+TBxnsINz52DJ8x04sLzca7IRwX7XDLA9oySGKXLTWhF0iPMQJi9NnTxx/cXG8qvrkkYe6wYx4D9OsEvhXe5wHKiopJGDVVq6kXXeFkJ5SJ6ETFJT5j6foHvIG8hpjvXEJgGt7oNYDnBQydGGHf4yuYKLZuhJLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URsPvMgp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URsPvMgp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 627181F000E9;
	Mon,  3 Aug 2026 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785756819;
	bh=NJ8jlfP/5ZQjZbrp1BGXiqn8TIOa3FFQ19qDOZqvyp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=URsPvMgpDzdDKRGI7EdvE3KD/8WQb7rmQUXfRwmYj/9xTOM220d+8ohwyzEEDL/Ds
	 Ir6/slca/Dve630AkR07s6vzMbPqDHqFiWr/PSidkkmM4iIez+qVK6ZdSfjC4yeAIX
	 OPoI06REPkDH5XmqOxY4ijo/PcgN+/GxSJX6ea6b+7MI5G82vHo3tHUqeukJmjEsGJ
	 x4ZaSYuNKdZwzEeoDwuaifd0schOJDPCc2H02pyvJ9vovzRagZOEBNtfFD/AA5jorD
	 6Wi1wPicueCmrg3l7pWTbDSP47tFSxrrIEGl555ooIzCIqzUgWLIc+Yj79ch9k0gNF
	 T5u9k9RuMbrBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v7 06/10] arm64: dts: qcom: shikra: Enable CDSP,
 LPAICP and MPSS on EVK boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: conor+dt@kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260803-shikra-dt-m1-v7-6-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
 <20260803-shikra-dt-m1-v7-6-7fec8e777076@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 11:33:38 +0000
Message-Id: <20260803113339.627181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The MPSS firmware path for the Shikra IQS EVK board incorrectly =
uses the 'cqs' directory instead of 'iqs', indicating a likely copy-paste e=
rror.
--

--- Patch [6]: [PATCH RESEND v7 06/10] arm64: dts: qcom: shikra: Enable CDS=
P, LPAICP and MPSS on EVK boards ---
commit 650ef0149b380b830878229ce3b6a1cd3b078c37
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boards

This commit enables the CDSP, LPAICP, and MPSS remote processors for the
Qualcomm Shikra CQM, CQS, and IQS EVK boards. It adds the respective
remoteproc device tree nodes along with their firmware paths.

[ ... ]

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
[ ... ]
> +&remoteproc_mpss {
> +	firmware-name =3D "qcom/shikra/cqs/qdsp6sw.mbn";

[Severity: Medium]
Is this firmware path correct for the IQS board?

It looks like the path points to the 'cqs' directory instead of 'iqs'. Could
this cause the MPSS remote processor to fail to start or load the wrong
firmware on the Shikra IQS EVK?

> +
> +	status =3D "okay";
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-shikra-dt-=
m1-v7-0-7fec8e777076@oss.qualcomm.com?part=3D6
