Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851534CEE52;
	Mon,  5 Oct 2026 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214996; cv=none; b=T1xjAHy7YvPFDb0cxKQj+sbfFTXojOni4wJPDlqzpOL9BoiuN8C5s6qoFK5BuhfbKcfEzsPF6+DjlvXnykhBh22PphHyFNB5D8pGvLiMYT+b1+iwiLt7XGsgnZPLp8Ghux+tAd3zaFFStd+gGBEb76c26sfawgKYqvGgJR+tcOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214996; c=relaxed/simple;
	bh=WRSX6rNeFF17G7wklQclDidu2nIdQbn5rhqL6oW8hhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kf22KT/hsRIu9p2e8cX7qJ8aeO38zXwq0TclqBNh+I52+Lr7Nzn8ZDVZhG1WT+45zr9/H45AzBiQ2bxWTZ0yxCxLAP8mmpnBxwrm0TtkvV3Yr3WlmyO6dVmDP48BLav9pPhyZTTNvZ0NcftLhKxjmUAw2QFnw+vvlaE21ye7xic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpX8MgKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpX8MgKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C3E1F00898;
	Mon,  5 Oct 2026 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214994;
	bh=xYY7MYLt3TR7qDauJJhV0FOmYU30P0qFRWm4Ln+0FUk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NpX8MgKYNAHimx7RN85C68LfI34IvQzNZVpFM8Z7L+rZjnkRdt1CGOHXvWfgC/r/b
	 /jsM/eKMNZaJL1kYvvJURzlyabmhXk2ejpsgRUICIoEX9aUmRCWGVXRbjvuIo3xYlO
	 qBUm70oW6xEKnNvupSfpEmhb87MK5Ep6xJy2r0JxXR12fXfygjpU4DgVp094OXIMw4
	 t+6lcpB4hboB1glf4IMVw9EptK1mUChTNEoBw4PGEC9eLhLLPk8m/hsn+iw+xUXmnG
	 uwE0Pc1onKZixZK0PS+wFNGWZMM45n55aGVDTphIy9r3Pvih+3AdqHXTglUSeyMJ5F
	 AcmxveIC884ug==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Koichiro Den <den@valinux.co.jp>
Cc: Devendra K Verma <devverma@amd.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260912174023.1227397-1-den@valinux.co.jp>
References: <20260912174023.1227397-1-den@valinux.co.jp>
Subject: Re: [PATCH v4 0/3] dmaengine: dw-edma: Prepare channels for remote
 use
Message-Id: <179121499286.358863.18382353505159158053.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:12 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 13 Sep 2026 02:40:20 +0900, Koichiro Den wrote:
> This small series contains standalone refactoring and new infrastructure
> for dmaengine and dw-edma.
> 
> It prepares PCIe EPC-local DMA channels for remote use. The upcoming
> vNTB-embedded DMA support [1] will be the first user and depend on this
> series.
> 
> [...]

Applied, thanks!

[1/3] dmaengine: Allow drivers to assign static channel IDs
      commit: f54701da5c0562cefadc8b638c3c141111c10579
[2/3] dmaengine: dw-edma: Configure remote interrupt routing
      commit: 9d31ad3b331d5d78bd6a247a9d35f35a6a9bbd59
[3/3] dmaengine: dw-edma: Account for the MSI vector offset
      commit: 742c2a8041e8c23ec4ac6688284ac12c623df1cc

Best regards,
-- 
~Vinod


