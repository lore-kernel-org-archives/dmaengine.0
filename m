Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345143BAD8B;
	Tue, 25 Aug 2026 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787638577; cv=none; b=c5K6HtayFJgIOgDLLH/xNAN7jsDZGG0lDeqY6zUAEca6zUY+QBJ91rGhNm5He5iFisQS+staQ31R2JfUA2C5xjfgG0CJc8c86eB2Lwl4phq+vBTe4wcBcWPh9H/M3T5oTSeWEdE97moqL6xRwAoPXnUEy4AaY2hbTkH5440Y1hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787638577; c=relaxed/simple;
	bh=S3DbMKYYshsNqS05DYOCtR/2o1y+6G01hOX/dn6RIwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oli3/YHMzTt+946t4Zje5snC+3S5+u1Xg9NMHu7l9DJZXbpF2K1JBUjELUpSZYgSP6+dqJ6y1zQhwUpgRraw3OMX5VQ3iInNv6pv2NoCiBYS/y3SXWjYKBCBfO3QisOD5MrTJz7cA9cbPnwOtfVyevT3Xt1RMRQyjamrjjyhS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8WxW5Yu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8WxW5Yu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732861F00A3D;
	Tue, 25 Aug 2026 06:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787638575;
	bh=ouRIdEdH8wqmj3o/0kmJqI1yTxkWRrRMWjOeQ1uMchQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V8WxW5YujWh4qR9VJD3Pob06vsnvvRI2ukLMX08qNlqazN5I+FNVHeBJYgi2/DiY3
	 Oy4dDxHsWCStp1usnS/tu84C/7uELuEbSEeE29rxWhRV27gASQOncihYlMKRW2Ovlc
	 8OgyjVV6IAgeNLFuPs6aucxIRevTxk5MSqN0+FlBYOnkCk2660mEKz1jtxDIyw8PC7
	 s61WEoQajFCQzdPyB72w+8Pe6w6D81df09o9d4s0p9X7ex4maRC4d5Fvo2qRqcv1+c
	 Yn/BAKJMsGryRcS6MAlcSKHI/4GkA57KF0pbhC423ubdNjJTdtjQuDq8Zjt/yTPgeG
	 hfKuXaSEwbduA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] riscv: dts: ultrarisc: Add Shenzhen Rongda M0
 board device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang" <wangjia@ultrarisc.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260824-ultrarisc-dts-v1-11-61ab7aebe9e5@ultrarisc.com>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
 <20260824-ultrarisc-dts-v1-11-61ab7aebe9e5@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:16:15 +0000
Message-Id: <20260825061615.732861F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Device tree binding header is placed in the local architecture dire=
ctory instead of the standard include/dt-bindings/ path.
--

--- Patch [11]: [PATCH 11/12] riscv: dts: ultrarisc: Add Shenzhen Rongda M0=
 board device tree ---
commit 67b0db49374b5791844e1a3b66fc62faab120bb7
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add Shenzhen Rongda M0 board device tree

Adds the device tree and pinctrl configurations for the Shenzhen Rongda M0
mATX motherboard, which is based on the UltraRISC DP1000 SoC.

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h b/arch/riscv/=
boot/dts/ultrarisc/dp1000-pinctrl.h
> new file mode 100644
> index 0000000000000..4668e45d2335d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-pinctrl.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#ifndef _DP1000_PINCTRL_H
> +#define _DP1000_PINCTRL_H
> +
> +#define PA0		0
> +#define PA1		1

[Severity: Low]
Should this device tree binding header be placed in the standard
include/dt-bindings/pinctrl/ directory instead of the local architecture
directory?

Keeping it here might prevent the pinctrl driver from naturally sharing the=
se
hardware ABI constants without violating include paths or duplicating
definitions.

[ ... ]

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.d=
tsi b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..ab927c6cd6146
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-shenrongda-m0-pinctrl.dtsi
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include "dp1000.dtsi"
> +#include "dp1000-pinctrl.h"

[Severity: Low]
If the header is moved to the standard include/dt-bindings/ path, would this
inclusion need to be updated to use the standard <dt-bindings/...> format?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-ultrarisc-=
dts-v1-0-61ab7aebe9e5@ultrarisc.com?part=3D11
