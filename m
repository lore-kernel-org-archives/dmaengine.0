Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FCD4A986
	for <dmaengine@vger.kernel.org>; Mon, 11 Dec 2023 15:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRjQEhbz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E1CC433CB;
	Mon, 11 Dec 2023 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702307075;
	bh=1YrRT7IzA4Ihuwv6ehGHUYg8NSaZHj7uaeGlSMs+Ub0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZRjQEhbzmyMbkfryspKnxuwSVtvo317UrIoOzgcbKCrJYco0b3x2mhw52Ejiw5WhZ
	 IDI9OGDUimIe13n2pvl8LOttmxdTXPDD9U817zSVzKf86totJFc9+XpwuQT5Jf4R/D
	 jXrqmMwSM8xmL+nHD5H8suRERegClAE7X8u+WimS8bG6MfQAoN1argRVAbN0EGFZ9Q
	 1+bXP1Q04E9p1geo8w2YmcwjXPZTGimvBsLo0C9jKYIF+kWGAEV3xF8JU/cCS6iKbf
	 PQYu5erNWE4uVqhJu/Aw4re9G1Mq1rbC5DhPXQirMnneblycesdh67vrBRInR7Ttxw
	 pwYELzUkOm6Mw==
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231124160235.2459326-1-amelie.delaunay@foss.st.com>
References: <20231124160235.2459326-1-amelie.delaunay@foss.st.com>
Subject: Re: [PATCH] dmaengine: dmatest: prevent using swiotlb buffer with
 nobounce parameter
Message-Id: <170230707383.319997.16133040652159955271.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 20:34:33 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Fri, 24 Nov 2023 17:02:35 +0100, Amelie Delaunay wrote:
> Source and destination data buffers are allocated with GPF_KERNEL flag.
> It means that, if the DDR is more than 2GB, buffers can be allocated above
> the 32-bit addressable space. In this case, and if the dma controller is
> only 32-bit compatible, swiotlb bounce buffer, located in the 32-bit
> addressable space, is used and introduces a memcpy.
> 
> To prevent this extra memcpy, due to swiotlb bounce buffer use because
> source or destination data buffer is allocated above the 32-bit addressable
> space, force source and destination data buffers allocation with GPF_DMA
> instead, when nobounce parameter is true.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: dmatest: prevent using swiotlb buffer with nobounce parameter
      commit: 70f008fb3ea9bd2e6727eebc858405acd49a212b

Best regards,
-- 
~Vinod


