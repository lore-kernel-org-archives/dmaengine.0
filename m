Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B99B37DAAD;
	Thu,  8 Oct 2026 19:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488817; cv=none; b=lVTXkuno7mqyuK29iaD6yIegk4lobDQVufAQGKUFedoyPFOj0jrXrqhbVDWMDfzAGtz8WrIXT3sNH4B982805GfyUvCTSjTvsP6emlsf8EgsTZjawtd+WEfiw/MdlWSgWOctRyhS5uvMzD608n3HJgEAJfBsmaTr2qZRGqavUE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488817; c=relaxed/simple;
	bh=TzGSYNIQECguVj+Yn6KeWD7D+472pF9yVr2EknBGUsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G/Q/f7/IRLhj2pC8qxg78azgaGKAtbTfWEfDOcwvEWfoGgFjP22m0+78nF7K9T3zKDOtlylYqrJnC5Flz2vqiny2+U3f9zh4W4Z4yQG25tA39DSd2YdZL55wGl5OaSJ7RypeGiHK54ZsyxkMaQky4n9SCtn+4xcmKXcgORIlZtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN+Snzfd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN+Snzfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CFCE1F000FF;
	Thu,  8 Oct 2026 19:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791488815;
	bh=k/2puUMOQV5M98h+Sa72R8DYJEfL5+feVDZUKEw+8YU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aN+SnzfdCANo7AE3v2irg+Z8j/dIELbHTR8gg583+p5ElUHvQ537p8n1uW1K+rL67
	 H2Xhtc+c5Q5bOe2CIf2mVkwbPMzJHUzAf6Ni8ufT4o8IUt9+LvfZVZmPGGz8WhFI9+
	 VB1d63skLOOYZrCnIn/AWgrEiqMXhe92t5A+rEUlx09e8ewOhuesT0kIPTuV7B47ih
	 b8oAofEvsmxm83xn6GUWgk5grvSdllrkuU2mqZRlZfYbEblC8HzoSq8ZMGPFur6Ij7
	 v0wwrT9qpgPl9NAQGMXFda2zBorRf8jh0p6TRjpdkqS9IzVV0c7qawKlkrlec9pXyu
	 U5d9qVNVa21kA==
From: Vinod Koul <vkoul@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 dmaengine@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
References: <20260909094009.2167-6-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 0/4] dmaengine: sh: rcar-dmac: add R-Car Gen5 X5H
 support
Message-Id: <179148881195.509321.530268466663787780.b4-ty@kernel.org>
Date: Thu, 08 Oct 2026 21:46:51 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 09 Sep 2026 11:40:09 +0200, Wolfram Sang wrote:
> Here is a small series with the needed driver updates to support R-Car
> Gen5 and X5H for the SYSC-DMAC. Details are in the patch descriptions,
> but it is all small stuff.
> 
> It has been tested on an Ironhide board (X5H) and a SparrowHawk (V4H)
> for regression testing. The testing branch can be found here:
> 
> [...]

Applied, thanks!

[1/4] dmaengine: sh: rcar-dmac: fix style in struct initialization
      commit: a416b656798317f1c6eb69d7a034b4dc392b3781
[2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
      commit: 73812307647a90234cbc1e474f2dec4bfa4ad34f
[3/4] dt-bindings: renesas,rcar-dmac: Add support for R-Car X5H SoC
      commit: 8d4237d153174af7cda2b3e45f4f47586a04dc95
[4/4] dmaengine: sh: rcar-dmac: Add support for R-Car Gen5 SoCs
      commit: 1d8ae2003de08f61095e4e928b1b8cce6c23cabd

Best regards,
-- 
~Vinod


