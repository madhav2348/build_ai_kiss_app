import { genkit } from "genkit";
import { googleAI, gemini20Flash} from "@genkit-ai/googleai";

const ai = genkit({ plugins: [googleAI()], model: gemini20Flash });
