Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C983CA4AF;
	Mon, 20 Jul 2026 21:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581956; cv=none; b=lzjKZSwsi9wnW3MEMGqDzpHhLt9udxeo8lrVwfz+ALrZx/PPX4jk4CQTTKksKatKQufOb3r7acCG/StWWpuE38n9VyG9Lr/2r1GYS7JBGLOYs9SPhrLt7XsbeusIT1LUNcvaQN7O+mGgDdYSZpVp0A5JG+OBBrDiswFywxnZTAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581956; c=relaxed/simple;
	bh=z8lwAxrRMR+4O/IzEOYaG2C+UzX4rfUjqvy3UScAUaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+w9adEhtKrZAAeheKg6hRNW4wRFCBxzxSpm0QDQHvFMA+bzdO8E26HZr0fdsPMzE4DvIV40LNh6VIc6ZaQrwbhfsjee42PkiRgM/eQM/iL+WnQrDrdtjub6CE8pFE38Yq3kpcOMxwXKTYtWTK9SNHI66So2TdnB61vfYaEFvNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffGUtv1j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffGUtv1j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0D51F000E9;
	Mon, 20 Jul 2026 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784581953;
	bh=vrEdd/QrJItLN285v1JbVZNXlH6wvPB5KhdC7WAyd1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ffGUtv1jREXsCf/F1n7640SYdnzavPxrBS51t1i/KTgpCzaaUaWIfe9RzLd/ZP0S+
	 5grnF9XynyAySNepM9GKG6gsXWj4HA9/nC2Wx7l+zRJKsnPyl2ZilL1wrIG43e1zT8
	 e0oJkJ2Jk7gXt15MNMEq6+U9ta281KNAobYKw/HmKxvWOkpgjh83jIA6300wqgHqa9
	 qprWQsLr9YLMr2eG1tTUWY7W6rFpf0sEUR0OkESe8ZszIMbA1omKRutcb6HD6r80DK
	 FlTlKSdY6pwCddzU4eSdSnsxsMfbgibIbk3VlmtSFps6IpjFD/+s72l8oZdXIIEQFt
	 Z++OlXGiTa0cw==
Date: Mon, 20 Jul 2026 16:12:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, daniel.baluta@gmail.com,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, simona.toaca@nxp.com,
	Frank Li <Frank.Li@kernel.org>, goledhruva@gmail.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, m-chawdhry@ti.com,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: dma: ti,dma-crossbar: Convert to DT
 schema
Message-ID: <178458194691.4126856.9458094651405397864.robh@kernel.org>
References: <20260713-ti-dma-crossbar-v3-1-734509b316c1@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-ti-dma-crossbar-v3-1-734509b316c1@gmail.com>


On Mon, 13 Jul 2026 18:07:30 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments DMA Crossbar from text to DT schema.
> Modify MAINTAINERS file to correctly point to new yaml file.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v3:
> - Add else block to validate dma-cells property better
> - Link to v2: https://lore.kernel.org/r/20260708-ti-dma-crossbar-v2-1-2ac0d6efde36@gmail.com
> 
> Changes in v2:
> - Removed the unmatched `ti,omap4430-sdma` compatible string from the
>   example block and trim down example
> - Restored dropped documentation regarding client dma-cells
>   configuration into the top-level description block.
> - Updated the MAINTAINERS file to replace the old .txt reference with
>   the new .yaml file path.
> - Added constraints on its inner tuple dimensions of
>   ti,reserved-dma-request-ranges
> - Link to v1: https://lore.kernel.org/r/20260708-ti-dma-crossbar-v1-1-f62796428f13@gmail.com
> ---
>  .../bindings/dma/ti,dra7-dma-crossbar.yaml         | 94 ++++++++++++++++++++++
>  .../devicetree/bindings/dma/ti-dma-crossbar.txt    | 68 ----------------
>  MAINTAINERS                                        |  2 +-
>  3 files changed, 95 insertions(+), 69 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

