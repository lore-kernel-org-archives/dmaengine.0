Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88DC3546F7;
	Tue,  7 Jul 2026 03:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394516; cv=none; b=Pz1CRiyowAkEwj8l1Em0fiqKMiIFrc17rA6V7g5yuS/X2aCER7BVTaYih2S1YKwbxYC2XldFr2AtVpabjVYsgCGOL1Wceby9zKCYmf8bSCN77Y5qOtoEpncmnE5eVYrJ7Jiz0ovesfIhHoysC44wgZtR0nV0ulqtgpFfx+kjAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394516; c=relaxed/simple;
	bh=kh4IibeM4fF1k0dFcf6mYXDxT+Z6Ghu5JoYeDgn/yoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/5BZ7Lt3haZiwVIMl9b7JV5I3ETQzK6mn7NhXJroFN4aeU0J2hyXvaa8pqGHsHnWq96zpA+7BUk92WO0cCri9ykk08nHzimcV9zJ5+OFSZ6XtPqoZ/btbzqSc8tcwaawVs3XziAltPiAqDszC1/xxKIFVIp4AyF+lkU+fA2RTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=na1b5nWy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="na1b5nWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867761F00ACF;
	Tue,  7 Jul 2026 03:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394515;
	bh=NAxBnsOhCNMohiZgxhYyA4/g1a6bYnN0z8VGa2lwoaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=na1b5nWylh+Y/YWMECNJk7FdvTkBOlMNo4bZAPwmvhkf5xb8Zs6XZ2ZhltP3nf4ja
	 CpUHNvutWD9U2A804/ad9lag9Aho8QrBZGp4H1+kCcy2ftPiK0DuNK8AGT7MXgNLxv
	 M9pFvVrzBV2LPcH/mDo0w1A3xyTvyIgF6EtBv68IGPulC70Tf3YqkghGcfxwqqINZN
	 2JBepXwHVyiU3qqpFghlF3Ieaa7EjIszvuMLM9FSFkSw66bLWZJJyMqZFM1c071cLY
	 +GOQxNaUwsWLxR0rfifjU8jtj68UM6HqYVDlR2+Ar2RWtD0XZAlr765K6BLBQ8MFdp
	 +exwwSVmaVrgg==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Arun Neelakantam <aneelaka@qti.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/3] Add support for qcrypto in kaanapali
Date: Mon,  6 Jul 2026 22:21:29 -0500
Message-ID: <178339449909.1938770.8933738266142836969.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
References: <20260514-knp_qce-v2-0-890e3372eef8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 14 May 2026 00:22:19 +0530, Kuldeep Singh wrote:
> Add qcrypto and cryptobam DT nodes for enabling qcrypto on kaanapali.
> Validations:
> - make ARCH=arm64 DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml dt_binding_check
> - make ARCH=arm64 qcom/kaanapali-mtp.dtb CHECK_DTBS=1 DT_SCHEMA_FILES=Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
> - cryptobam and crypto driver probe
> - kcapi test
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: kaanapali: Add qcrypto node support
      commit: 0a4015962f8115bdca3c0c4d0420f2ff85409194

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
