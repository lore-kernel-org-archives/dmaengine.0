Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168866;
	b=GgHL126j1HgHeS18IQHuctfOjfBx2CuOTB3On8q8T6eGlAR6i+SNsZbK+bpK0RUe13GG
	 OT7us1525ZE6/uk5n7ozZb78I99RDBi01GoTTTrTUupyOZBsBeWi2pGsaqHx5FHuz20kA
	 xlHPqYWilocQmDmSnS5QjGyjYhftvkyMXjxTccOntaTwIYi2nqsTqNuiWHYLqwvS3bsyR
	 nviGjm5HMR2XCSRBcMqdOXjs0PULpbaR+7vfAGnhzHipi4ZS1mZTWbTA85DmQfZK3xjbr
	 K/VHq5U9+BI7XGxYBWgGnPFfjb4MEyPfZ/3c3vMCFS6Ugs3urvaTcdz62mV0WXGO3PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168866;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=TEM/lwyfYjFDZGkgKWhS1fxpehScreTDFbg06MSARgw=;
	b=VuSw6bgoUiaZEDFsMJlgD0MQBpmWlTYStlAfSa6iGM31zf6GjBWG+OupO8wicJHnUtAp
	 vA/JcN7Y7SnTNF2dJr4cyTBDLpdAYdbdrEwFXrutapgwCCYs3N+6h21kITgaKXvMf3hS4
	 1eYZYBL+86OICDRI2mRjHCeHM8R4Xi3lgdBS33hMiUZCDhrMaQioyhXF91DxNhZn/FenD
	 vQWNOGu4JmRCyBNU+OtkOeWMBQLKpC0Wv1Ck+e5KfrDGohS6kmL0L7MICwwbwIqEFcfht
	 Q/iby0K7CiNA81DC6FEMcRZUpJKLb0+Atpw5wJtlHGeDcY7E/7wxN+TAyauJ0hABxDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTyJ47H8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0196A606A336;
	Fri, 20 Nov 2026 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTyJ47H8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D711F000ED;
	Fri, 20 Nov 2026 10:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168865;
	bh=TEM/lwyfYjFDZGkgKWhS1fxpehScreTDFbg06MSARgw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eTyJ47H88RxfllOMLe3j4uRy4TDGOMXxDlsrUGB0NkCv7mdelT+iDZz5Vp/AUpsWP
	 kcvxInSd5A+0y4JrnK4CQI+F0FAbylJTG0m7e+zscGOY8Ja5Vel8UByfPJZBR/whBl
	 8soi7Ep2obpUTllFowND+1ZQzUKvhGRzdwwKu5l52oU2BQf7XySa7s4ZLeDgC7udPy
	 6F23xDG69QwDOR3mXqvhUU7Vvbl17b4AXYTHjbQo1g0X9Ycw5zt1gW5+nWecXidYBI
	 C59zpSStvY8G2eIKL32g3Y7iVSjITDnVrlu1vV6iN2atR26u1BN4jPUpLt7prrdiWL
	 lUfQk6f5FwomQ==
From: Vinod Koul <vkoul@kernel.org>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, Frank Li <Frank.Li@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Kees Cook <kees@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
References: <20260918141622.3022876-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] dmaengine: use assign_bit() where applicable
Message-Id: <179516886198.45276.2354167655096140791.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:31:01 +0530
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 18 Sep 2026 22:16:17 +0800, Peng Fan (OSS) wrote:
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch.
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: use assign_bit() where applicable
      commit: 15e06365b056e9e73723295a1de9205159e28f1f

Best regards,
-- 
~Vinod


