Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777CB4D09F3;
	Mon,  5 Oct 2026 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215008; cv=none; b=KkbCY54Zpyi0QySl+S9u/1MPBYkomnsVjeTBTRxYWeEod5KiMKK0YUoLddoOtaC+E0FHsCje7BzQpXPd4BZOdxQE9bxUySGVp5yTlswGiClziEarr/4q43cFW39izG4g+N7NH+aLkN3Ou9QvngUeCADFYOjQsOgfYNPwZMCvBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215008; c=relaxed/simple;
	bh=0QsYJAEtA/wcZmbgGyZ19sQErgmiCOhqDt3alsmxDTI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SYQ9Wo22UbPZN12LxUCFP+jF1Lz+Nm6FJhz87qhl66TZGi1Hm8cq+zEytc/otGnQhnUwjY1W2gFEvG70w75sv/8SyVZWjlZy8WkPt8QQpmSZ3zcyh9Am+C3tK3z6dIbdC2hZbqq+EEXd4tQYSdtTKozVObJego+Zl68LMSmz1cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TniW9neX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TniW9neX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6FA1F000FF;
	Mon,  5 Oct 2026 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215007;
	bh=Q5WuGdChPOQR0vjftfl5fUSQjcwbvKwZfaPsZ7I0dkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TniW9neXllce7NIK2HiIcHuRubQzns8HlabuzsWcp3yG85FBThAFvjZdmvfuV7aEc
	 cpHkuKa0hEnF10t0ClbRcQDlYph/dCcWVeBA6gm5yZz+TM65uO8geOGpt4OuOnW9ZC
	 JS2eMfltT2QZAOt8oQ2AB4PKX3fjPZerLgSH4RitYjwLscnvLCHbXNwlQmNx0Lcz3z
	 dBCtiS53rrGO5Jh91sjM70fP4mPJFuGJyQmUdkiF6Gq2E+YZbjJglXs2vdy9FwquUF
	 smDcna+FgKNgAnKpQ7mdgkHZ++TV/UjYrO0J48KpZChxrDBR/PyH96y7GLcg1RHDfR
	 M2x+fAs5KRP9w==
From: Vinod Koul <vkoul@kernel.org>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Frank Li <Frank.Li@kernel.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Sinan Kaya <okaya@kernel.org>, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
Subject: Re: [PATCH v3 0/4] dmaengine: use designated initializers for
 acpi_device_id
Message-Id: <179121500435.358863.16138122883017416450.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:24 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 16 Sep 2026 16:27:53 +0100, Pawel Zalewski wrote:
> This series is converting lists that contain the acpi_device_id struct,
> which is defined in the include/linux/device-id/acpi.h to make use of named
> initializers (which they do not use currently). This work is part of the on
> going effort in the kernel associated with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> [...]

Applied, thanks!

[1/4] dmaengine: dw: use designated initializers for acpi_device_id
      commit: 3a03a5866e82027c0fa96f6208721397e5a6ff78
[2/4] dmaengine: loongson: use named initializers for acpi_device_id
      commit: b37c93bc1cfd0f5fb898b7943bd0c1797341a41d
[3/4] dmaengine: qcom: use named initializers for acpi_device_id
      commit: db09763394959442d91d86840717412073c41abc
[4/4] dmaengine: xgene-dma: use named initializers for acpi_device_id
      commit: b2c203a5878b0d3f95e4802fa01e320d317b82cf

Best regards,
-- 
~Vinod


