Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1B22D3A6A;
	Thu, 26 Mar 2026 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531328; cv=none; b=nABxUsRh5nPIBo+aQHNiqYIeHNqulA9rurRb0MoksNml5RD5Tb5QzcN/mlwH63OFNTIASCQoEBbnrfQ/fzdKXXOqtRM1mJrirzXE3AYlx8tmcbjuna4xtyPb0aWgzotx5/kbsQMwREkppTSRZmfwtAFnmp+Tk4V7cJGyb4JqgC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531328; c=relaxed/simple;
	bh=FqviOofHcupaR0PJdYP1xhrpYp3IqlmmCCw7Mja4j6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQdRhHaIeEGRSPrtEaZrhI+Bi49zFnB8hnVvcP2N18FBc/0Wyq66wonNCdoa4ZxIrMNnZQ/cERsPMe+uNshCceRgEoI/Gk+ihiSIBDz9siegtUT/XOmVn4WShuww/qvf1NRPvhDjwZyRMbSWAJ3RhKRsAib2qIkipltdz2iZH9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTJWV+BH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTJWV+BH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2527C116C6;
	Thu, 26 Mar 2026 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531327;
	bh=FqviOofHcupaR0PJdYP1xhrpYp3IqlmmCCw7Mja4j6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTJWV+BH76Iv2CnFB2JvggheKH4Xz8DIDxtX+r1t+NaDmOQEp8pdCWVyzjrkjQgDz
	 gqmWL962pMBGyzd9aOon6+zH9Qu/wGfg006ldueWdYhJdQvm2LgTci2ErkRfqIiwOD
	 nCCvXQLOCVskFFFE7LveT3cq1VZeKStCFYemyyh3GC6qVyEN3PREYKVQCCcRTvwrk8
	 hhr5xu+IBKo9SIuAGvjGogR4wlQX9eoPbthxENq8K1DTVS+sC0lyE8KWBkxHqYdaLX
	 LvvMNvi/4fG012KPdbgkMgzJw5vH8OmYFCR0ADtF/G+3sNTV+57hArlB+Yb/hTEFVA
	 pLBXjWyQ100lA==
Date: Thu, 26 Mar 2026 08:22:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	devicetree@vger.kernel.org, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH V2 4/5] dt-bindings: dma: xlnx,axi-dma: Add
 "xlnx,include-stscntrl-strm" property
Message-ID: <177453132469.2249522.18301971752512802709.robh@kernel.org>
References: <20260313062533.421249-1-srinivas.neeli@amd.com>
 <20260313062533.421249-5-srinivas.neeli@amd.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313062533.421249-5-srinivas.neeli@amd.com>


On Fri, 13 Mar 2026 11:55:32 +0530, Srinivas Neeli wrote:
> Add an optional boolean DT property "xlnx,include-stscntrl-strm" to
> indicate that the AXI DMA IP is configured with the AXI4-Stream status
> and control interface. This enables the use of APP fields in DMA
> descriptors for metadata reporting.
> 
> This property is distinct from "xlnx,axistream-connected" and serves a
> different purpose:
> 
> - "xlnx,include-stscntrl-strm": Indicates whether APP fields are present
>   in DMA descriptors. When enabled, the driver can access status/control
>   metadata through these descriptor fields.
> 
> - "xlnx,axistream-connected": Indicates whether a streaming IP (client)
>   is connected to the DMA IP.
> 
> These two configurations are independent of each other. For example, in
> TSN (Time-Sensitive Networking) designs, a streaming client may be
> connected to the DMA IP, but the status/control stream interface is not
> enabled. In such cases, "xlnx,axistream-connected" would be present while
> "xlnx,include-stscntrl-strm" would be absent.
> 
> Adding this property allows the driver to correctly determine descriptor
> layout and access APP fields only when the hardware supports them.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---
>  .../devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

