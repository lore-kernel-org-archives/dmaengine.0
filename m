Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341AB429802
	for <dmaengine@vger.kernel.org>; Thu, 30 Jul 2026 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422130; cv=none; b=bpFkhRfvFwLzXkobzvRiQvMsEAuglDgug7q+j9DrE8UlGJW8tsv4Junxm2Zc/9DvpZvWZdmbhTdGXDwrXRDydoKLsvUZTrt9bb65oiTsD3Hxt3aBzDxXa+dPSuBkDXdmSJwrLh1oNN5sNYyzI8Q+wOeaVA6cvW/EPR99IMwJpB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422130; c=relaxed/simple;
	bh=V1ytNrRTof9fljMTD3vdp0SdiVj6RL1JoQ/6fQs25bs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aAyAZLpsaRM5gCEnjKZR9wcEYCJUPXb/skbwptXlaMpqq4uiUJ2mTsA8ANqzvhCfNCeyjM2GmPeFbpYsSMJTEwsbv/ig7cm/aPRfI+XQf3bKUsWnSjqzlhjyByD28KGs6wa5QKPIlbdbii0k0XoyhG4ratwhK2KvMu0HaccUp/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xt39RsY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xt39RsY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7ABC1F00A3D;
	Thu, 30 Jul 2026 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422129;
	bh=V1ytNrRTof9fljMTD3vdp0SdiVj6RL1JoQ/6fQs25bs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xt39RsY/RD1mPmLFHupNoqsBy43mBlD//Bp2pveTohvo90WA/et8FVIknZIJ7f49p
	 aU5rnsQkJTWjtthZVnef8RUAWJ5+9TRJpuzGTBMb7D1idnKQJukoZcQ4RLa7CAZ1BS
	 AmlfF74DIb8YikzOU2S1GH4iAmvNqkqoNHLtgehslvCXkcCYgUPCDMneSh2X5PDcv3
	 WJRngqXQNN/sRRyK25WPHNnjJWwEFG1tp2XEQzUBJ5YAMm1QHqz5OJWTFtcAEz6B5J
	 y65sj8ZwvX8hdaFGK0tpWhAAWrQo3ZigWuej5cN84b4nbLzTs3PKctPg2XUAxGr6G/
	 YBqJUI9/gM9Tw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] dmaengine: stm32-dma3: Use bus width capability
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: dmaengine@vger.kernel.org, Frank.Li@kernel.org, vkoul@kernel.org
In-Reply-To: <20260730-dmaengine-support-wider-dma-masks-v1-5-3732f1f9d9ca@analog.com>
References: <20260730-dmaengine-support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com>
 <20260730-dmaengine-support-wider-dma-masks-v1-5-3732f1f9d9ca@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:35:28 +0000
Message-Id: <20260730143528.B7ABC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Direct return on error from `dma_set_src_bus_widths()` or `dma_s=
et_dst_bus_widths()` bypasses clock cleanup, causing a resource leak.
--

--- Patch [5]: [PATCH 5/9] dmaengine: stm32-dma3: Use bus width capability =
helpers ---
Please note that the format of this report has been altered due to recitati=
on
restrictions. The original patch code is not quoted directly, and findings =
are
summarized in a free-form text format.

commit 843bd75e7b8b643c8fda123b493184a039d48a35
Author: Nuno S=C3=A1 <nuno.sa@analog.com>

dmaengine: stm32-dma3: Use bus width capability helpers

This commit advertises the controller-wide bus width capabilities through t=
he
new dma_set_src_bus_widths() and dma_set_dst_bus_widths() helpers. It also
updates the per-channel capability callback to clear unsupported widths
through the dma_slave_caps helpers.

[Severity: Medium]
In the stm32_dma3_probe() function, the patch adds calls to
dma_set_src_bus_widths() and dma_set_dst_bus_widths(). If either of these
helper functions returns an error, the code now does a direct return with t=
he
error code.

Does this direct return bypass the clock cleanup?=20

Earlier in the probe function, the clock is prepared and enabled via
clk_prepare_enable(ddata->clk). If an error occurs later, the normal error
handling path is to goto err_clk_disable to ensure the clock is properly
disabled. Returning directly here leaves the hardware clock prepared and
enabled, causing a resource leak.

Should these return statements be changed to goto err_clk_disable instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-dmaengine-=
support-wider-dma-masks-v1-0-3732f1f9d9ca@analog.com?part=3D5
