Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065634FB9CE;
	Thu,  3 Sep 2026 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455119; cv=none; b=GtAA4/RoSYNJ4luNRcRpKUkwxTV+9uRkvFKtxi1w708ugvQev+Ro4Vnl0KE6rdT0LvezCStEKqFsBbGDkKURLkzKqSA1Oq5zKu5oLv16QtHAZ5uUmtnArZybqkEsQsE7N9C2Qjz7Ic5S40N/cgj0xCC0ZUYIl4SWfYnyUGL5HRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455119; c=relaxed/simple;
	bh=0YQHl1aqkzK4NTjDjkn3I8E2Q8j93GuHdua4hRrwInQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Lxcs9uQT9mo61rf6b8NNWvNkBuob/rHV4y6HOJHE8LeLaCkhpL+HifvVUcr0T6UxobeHZEPi14jMUKnCTA5ivkF/p1QWRTnJkg3fblQI+ezQhbs46WraWPyMsLO+TVPaeWfTEmpWQpD3pZCqWzky2U4x2AQUvXuczssYZ+Eevd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIW9sfsr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIW9sfsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DB11F00A3D;
	Thu,  3 Sep 2026 17:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455117;
	bh=2VWPSDgeEYZkS8jJx9LgwemGcEjda5UfbzkztLuI2C0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KIW9sfsrVaL/Vcx9kh+8+TYdmuFw3niJFtrj/bq1K3CsqFMgNuL4O8gaDbUFyn9bs
	 kwhMaXPFR+PQmB2vgkJjLuPRFPLF2gdx3vTjQqcM3niYV0ValMfoeknohyh4/QgFfT
	 wfQaRakdKa9r7LyH3K3Du9t0sImy/cQRf0K+/C0Xk3gYABNEuAk4tk4hnrPZqd5+/Z
	 O75HTq4/zX1zlZcVPVctU7+YJ5eMj2VuuDpMdVyzHQsiJmYSlyWyOkAOOVuUFgnbMk
	 v5e6Xcn3aQDP0Vb/tj19xbg30X4R93qORp1wqwy8ux8BqYpEWZiZKXeUJ/VWg+F08B
	 fPcqPy+rW1ezg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Kees Cook <kees@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>, 
 Serge Semin <fancer.lancer@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Niklas Cassel <cassel@kernel.org>, Koichiro Den <den@valinux.co.jp>
Cc: Devendra K Verma <devendra.verma@amd.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Subject: Re: [PATCH v6 00/10] dmaengine: dw-edma: Prepare for dynamic LL
 appends
Message-Id: <178845511295.1711546.67738320166778964.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:35:12 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 21 Aug 2026 02:34:29 +0900, Koichiro Den wrote:
> This is the first 10 patches from v5, split out following Frank's
> suggestion:
> https://lore.kernel.org/r/anzgNmxSV2vf1w1X@lizhi-Precision-Tower-5810/
> 
> This prep series converts the LL into a reusable circular ring and
> prepares the doorbell and IRQ paths for the follow-up series,
> "Support dynamic LL appends".
> 
> [...]

Applied, thanks!

[01/10] dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry index
        commit: d264343b5c1bd005f9b0f30692548786a7049a39
[02/10] dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL control-word
        commit: e9a0a18e139866ef9a0a92ddf9149a0f59eeb473
[03/10] dmaengine: dw-edma: Factor out linked-list transfer start
        commit: 20da0bec453df65473a651a0787878e10132a1c4
[04/10] dmaengine: dw-edma: Make DMA link list work as a circular buffer
        commit: 834fd098070929899920a947fd5dba295433d41f
[05/10] dmaengine: dw-edma: Move callback result helper before LL helpers
        commit: c7db522c2d1c55ac26b2016628f1a8f39198c972
[06/10] dmaengine: dw-edma: Dispatch DONE interrupts by channel request
        commit: 1498754a33b68a2aa11e14ee5df83acc3c084f9a
[07/10] dmaengine: dw-edma: Centralize LL doorbell decisions
        commit: a8ac669fb01af5503a1defaf3552be5e1d3cf381
[08/10] dmaengine: dw-edma: Prepare LL progress event handling
        commit: 0771294b6e855d76cd04f048c38cea87b4202b49
[09/10] dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
        commit: 31982eb666e96f88e44fae8c8e91bc97f86a97f7
[10/10] dmaengine: dw-edma: Prepare LL kicks for event serialization
        commit: 256b61fdc708cfa34a84266a2c9bea64f44c534d

Best regards,
-- 
~Vinod


