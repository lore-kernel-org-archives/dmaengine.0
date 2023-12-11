Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA274A986;
	Mon, 11 Dec 2023 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzHE3pys"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A26C433CB;
	Mon, 11 Dec 2023 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702307070;
	bh=oEHEZ/BZD3hXy5YrgjxCeoF/SHNeUm8EOWEDSzWiTPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CzHE3pyszj6WWL+ZhVIdIgiSQij6QaNCh3+YllWQ2kPXJSo8xUW1cNXgsIT1P+8el
	 0FwDa6R+b60xYAnMCGtYzcYOK6GWtwMjRA7hcsqXlM08EO8cXMu+SHVPB7pYk/n0Td
	 W2Vzuui6baPjBs9uGVYV+afhld7R/j8W8MTLcQ9CUvva9CrWp1kLJ3tfcx15FPeIOc
	 hi6+2/7rmZw+xq0y8GK2gVxyJx5gbL1gC8wNEpSG/MVLNq/AnNkQnmXgK/0jlGkgDU
	 otBkLixKURTxZNcC7YNmsZgNTATKvgX3/1CW8dyXS0Gu0CDyMnGDrZ/MD6cqJwxko0
	 xlpuTEnN/B9ng==
From: Vinod Koul <vkoul@kernel.org>
To: green.wan@sifive.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
 paul.walmsley@sifive.com, conor+dt@kernel.org, 
 shravan chippa <shravan.chippa@microchip.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 nagasuresh.relli@microchip.com, praveen.kumar@microchip.com
In-Reply-To: <20231208103856.3732998-1-shravan.chippa@microchip.com>
References: <20231208103856.3732998-1-shravan.chippa@microchip.com>
Subject: Re: (subset) [PATCH v5 0/4] dma: sf-pdma: various sf-pdma updates
 for the mpfs platform
Message-Id: <170230706622.319997.1279433550352049584.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 20:34:26 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Fri, 08 Dec 2023 16:08:52 +0530, shravan chippa wrote:
> Changes from V4 -> V5:
> 
> Modified commit msg
> Replaced the sf_pdma_of_xlate() function with
> of_dma_xlate_by_chan_id()
> 
> Changes from V3 -> V4:
> 
> [...]

Applied, thanks!

[1/4] dmaengine: sf-pdma: Support of_dma_controller_register()
      commit: 8e578b47e6d92d5e43982ddc54045973dd4a7de5
[2/4] dt-bindings: dma: sf-pdma: add new compatible name
      commit: 72b22006ba78c2e3bf39b486a7b8155dc9020133
[3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
      commit: 58eea79a1cf285a62af886851b1a91ed5aceb401

Best regards,
-- 
~Vinod


