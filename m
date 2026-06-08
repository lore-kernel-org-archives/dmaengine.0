Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027DE2DB798;
	Mon,  8 Jun 2026 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920784; cv=none; b=lIMevdnrMfxN7sekSKQqXXi9QfR4FXyC+G8UksRcXTNaiX1u7BxuFSzOLE+ly0EZ7KOAV1DvqhRIe/sTlemO0N2hT66GQ2aSgAqq0luf/cQ4BI466EZfYFA5QYNAz2Not14e0IGT3u9ibLRsvHCDxWnDV3c1pXxr/YOkGaBAK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920784; c=relaxed/simple;
	bh=5K8A+OsfCTRjfODjWt3JK8ler7QqzmPEA7wEL6Adoy8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jH7+Rsm3W8mZNmpY0JgIQ4JxM93y1ATls2jg1UXuT8BmhxyVp9kYmNpvpQIEcPn1scfcHuXqb+wNeO7LmN9t4HnQs+VBaQaHEHjx59r+fXGkKQTpWceR7V6SzmgDfzlKkwPCbG7cqiekk8kTzIW5INbgu2inYim9LNcS4VqVkJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqRNtayI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqRNtayI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69441F00893;
	Mon,  8 Jun 2026 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920783;
	bh=b4Ibo9LmvdLKVKs3dmKbH5oM1euS0Arni0r1WyAEB3s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IqRNtayIiLNV4RNEfEjyBSKfa94PnYxXn2r+F9CGM6u0c54AGpz5ZB6L8PZ7ejCe/
	 /iEQbpxnqceCfOwewtAH0nv+FujbiAU6nPyW68Tb1YQSDtem/s9EibO1DQXRkVQW1y
	 9SI2E3M9WLxa7wHlD4Jtu8ezDiTVNc13x6Eoyw76DDPg6ukSICnZ07dK4duHKMag3p
	 tfeHI52kU8IJfc20c2HK94unxAxQVZjSSnX4rJvqKcj+Nk8Y1GiSt2TMROTUmlWzRR
	 Zn0QCYHW4NBssjBWIAcnNE8VhUmKyLJKQ9tPYOmbfww/5J+ejU0u3HRU1OfC27KeCY
	 QiX/h9rjTnApg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Kees Cook <kees@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602070344.3707256-1-zhengxingda@iscas.ac.cn>
References: <20260602070344.3707256-1-zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH] dmaengine: qcom: gpi: set DMA_PRIVATE capability
Message-Id: <178092078035.96550.5970255410475103714.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:43:00 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 02 Jun 2026 15:03:44 +0800, Icenowy Zheng wrote:
> The GPI DMA controller is only responsible for QUP peripherals, and
> cannot work as a general-purpose DMA accelerator.
> 
> Set DMA_PRIVATE capability for it.
> 
> This fixes error messages about GPI being shown when an async-tx
> consumer is loaded.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: qcom: gpi: set DMA_PRIVATE capability
      commit: 4e351f408743354d54ee1af5193fc78234f2044e

Best regards,
-- 
~Vinod


