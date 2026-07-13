Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E8B1DED5B;
	Mon, 13 Jul 2026 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971768; cv=none; b=grjMT19w6HghzZgVytFcUpg3EiJT3+S9z0Le5RGo9Ci9WYNSAUKDDgIy3yYLD+fLXmWs0NVp9IAA8weu7y4Fg33NAFmGfo7WtZFb89HXUklQEgGgYlQkCd6BcCBnOiIijNgwYiei0qAi+5Lom6A6RlUpKPv2IQfJ5zkTpY9vNpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971768; c=relaxed/simple;
	bh=/vYHS96BW+9vTUzU2bvVGFdcdxyli4EPs943INPCeHI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VKHmjOjvw9tyajmQDEwrSOoImjfBnkAncEwyJHQFbR5RWZogdDhxFinmB5xgGpaIPm5c6+eWLWTylO+RJYsX9ay87xGnq/GI8+x/eCmHnzzYpE8kzewwhQqtezwFdJ2QE7Su19hY74Hu3Mojf9w0i5YTdoVSIv7Glg0INUF2XWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/3eATsc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/3eATsc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67CA1F000E9;
	Mon, 13 Jul 2026 19:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783971767;
	bh=elXTeEAGkdpcwI97nGR5SmwcDg8hTQbyL2nyh9ZsNes=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/3eATsc6K98u3BI2GdPqvZTII1yKFse+0pC1Wjbq9ca3r6uUFl2jhUCl1c2xzdw4
	 x7T5+hTAfPoXKJAkSaQOo0dGo0gGlnpAJn4MLcb+A8eCAAc4BgqulRI3vHS9E66o1D
	 7kFRq3gZ8anUeqvnenxdaTG2kDjXUX7AaEguZTBWxHWFcQvV5gVhiYLvBTJOUOwgtF
	 +oE7xV1wSMeEV5q6D02dt+8mMqcpz+dBHwqM1dsiTTyET8ppnjWfCKDyyzHG9SYsZU
	 QiaXErvvtPPM6fhE0N3EFhCuoKYE6TVypleojjSvdmCnBVRh66+gaRfPUNrDm/dx2b
	 aE5y8ZSwM3CxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: shikra: Enable CDSP, LPAICP
 and MPSS on EVK boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260714-shikra-dt-m1-v6-7-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
 <20260714-shikra-dt-m1-v6-7-bee265d3499b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 19:42:46 +0000
Message-Id: <20260713194246.A67CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The MPSS firmware path for the IQS EVK board incorrectly uses th=
e CQS board's firmware directory due to a likely copy-paste error.
--

--- Patch [7]: [PATCH v6 07/11] arm64: dts: qcom: shikra: Enable CDSP, LPAI=
CP and MPSS on EVK boards ---
commit c0f88c4032c0357d309d8548cec707d24e9ad614
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

arm64: dts: qcom: shikra: Enable CDSP, LPAICP and MPSS on EVK boards

This commit enables the CDSP, LPAICP, and MPSS remote processors for the
Qualcomm Shikra CQM, CQS, and IQS EVK boards.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boo=
t/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd7594..727809430fd15 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
[ ... ]
> +&remoteproc_mpss {
> +	firmware-name =3D "qcom/shikra/cqs/qdsp6sw.mbn";

[Severity: Medium]
Does this firmware path incorrectly point to the cqs directory instead of i=
qs
for the IQS EVK board? It looks like this might cause the modem remoteproc =
on
the IQS board to load the wrong firmware intended for the CQS board.

> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-shikra-dt-=
m1-v6-0-bee265d3499b@oss.qualcomm.com?part=3D7
