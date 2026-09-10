Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533349EC53;
	Thu, 10 Sep 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049437; cv=none; b=EdpMf1gqoOavFYpijnCmgNb3dRumKq6ngjMydfjxpsBmxCfntXQPm72lZt+VGukha/Sfp/FKeezqOLOzpehqIojI3lRUpPQv2mI/XmK/Lq2MBWGec5OLE07YC4OqXXyEGcz3IvVzonMfuC8UAKPnT43cK4TJ/tFLkd3WpAtG2+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049437; c=relaxed/simple;
	bh=sX9VeMgxaJUZbm7FWjKscwxyqETUZ8S9kmOxgSFhNjU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gr+pfdToseoNYAf0aT4UnWcT5CoL53bt4LkYP/UEa7Bj0LGkuSafS7J5Uc6SJOkLhA2eHCRl3XI4BN/Cmq4Yy15buQzGenrJV6eJcNk47gShuUMoii6IOYCbcE84vEx17jj5Z/3XPPrta6ZGbileOLEK2n4qqqIpM76Z4Xx44Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOEp4x1+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOEp4x1+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62FC1F000FF;
	Thu, 10 Sep 2026 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049435;
	bh=9sR4iCDNmPmuLycqrtaPoXOdVxq9vF8KjjQ+eF2z45Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WOEp4x1++BsXDfyTPXTDS4gmVFX7J2ksk9lukdERrQLJxB2SKNofdAWP9wGSvBEhO
	 tC3006JjZtardegEGy/OALXz/UR69TACxhMazYNtw7lbQIKz8dlbIU71FndxUDL4p0
	 ixr1puTbO/JgAXIAScwYvUVOSuARgamABHJqdNGNgcvJzNXK4tmDvb/0ng2b3dy2Pi
	 v/ll+G0ZwlY/SweT7j1HKshx0ckV+E4JzVL2pXyvgVilgz5qfRbFPGz04Gbc7Wb/A4
	 mpnQYfbefzYMV8A8IthZxOBWhS98UqiJC+jmceoouDnnNmDcwDNVKaJ0j1UXx9SI+R
	 xp7jmkf/jq3ow==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Frank Li <Frank.Li@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260908212607.590224-1-rosenp@gmail.com>
References: <20260908212607.590224-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: at_hdmac: use devm_clk_get_enabled()
Message-Id: <178904943321.118320.1490189042723625622.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:40:33 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 08 Sep 2026 14:26:07 -0700, Rosen Penev wrote:
> Replace the devm_clk_get() + clk_prepare_enable() pair with
> devm_clk_get_enabled(), which handles enable/disable and the
> unprepare on driver detach automatically.  This lets us drop the
> err_irq cleanup label and the clk_disable_unprepare() calls in
> probe error paths and at_dma_remove().
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: at_hdmac: use devm_clk_get_enabled()
      commit: d882935a2ca4457f6f446b02d7d08134cd9d4582

Best regards,
-- 
~Vinod


